from reportlab.lib.pagesizes import letter, landscape
from reportlab.lib.units import inch
from reportlab.platypus import SimpleDocTemplate, Frame, Paragraph, Spacer, Table, Image, PageBreak, Indenter
from reportlab.lib import colors
from reportlab.lib.styles import getSampleStyleSheet
import pymupdf
import os

def estimate_table_width(table_data, font_size=12, padding=6):
    max_col_widths = [0] * len(table_data[0])
    for row in table_data:
        for col_index, cell in enumerate(row):
            cell_width = len(str(cell)) * font_size / 2  # Rough estimate
            if cell_width > max_col_widths[col_index]:
                max_col_widths[col_index] = cell_width
    return sum(max_col_widths) + len(max_col_widths) * padding

def estimate_table_height(num_records, row_height=14, header_height=20, padding=6):
    return header_height + num_records * (row_height + padding)

class PDFReportGenerator:
    def __init__(self, filename, table_data=None):
        self.filename = filename
        self.table_data = table_data
        self.page_size = landscape(letter)  # Default page size
        if self.table_data:
            self.adjust_page_size_for_table(self.table_data)
        self.doc = SimpleDocTemplate(filename, pagesize=self.page_size)
        self.styles = getSampleStyleSheet()
        self.elements = []
        self.toc = []
        self.temp_files = []
        self.page_number = 1
        self.entry_counter = {}
        self.summary_data = {}
        self.summary_template = None
        self.current_page_height = self.doc.height - self.doc.topMargin - self.doc.bottomMargin
        print("Page size:", self.page_size)

    def adjust_page_size_for_table(self, table_data):
        estimated_width = estimate_table_width(table_data)
        estimated_height = estimate_table_height(len(table_data))
        print("Estimated:", estimated_width, estimated_height)

        if estimated_width > max([letter[0], letter[1]]):
            self.page_size = (max([estimated_width*1.1, letter[0], letter[1]]), max([estimated_height*1.75, letter[0], letter[1]]))
        else:
            self.page_size = landscape(letter)

    def set_summary_template(self, summary_template):
        self.summary_template = summary_template

    def set_summary_data(self, summary_data):
        self.summary_data = summary_data

    def add_template(self, template_elements):
        for element in template_elements:
            try:
                style = str(element.style)
                #print(element, style)
                #time.sleep(1)
                
                if 'Heading' in style:
                    text = element.text
                    level = int(style[-3])
                    entry_id = f"{text}_{self.entry_counter.get(text, 0)}"
                    #print((text, level, None, entry_id, len(self.elements)))
                    self.toc = [(text, level, None, entry_id, len(self.elements))] + self.toc
                    self.entry_counter[text] = self.entry_counter.get(text, 0) + 1
                    #break
                    
            except:
                print(element, "doesn't have style")

        self.elements.extend(template_elements)

    def add_summary(self):
        #print(self.summary_template)
        if self.summary_template:
            print("Adding summary")
            summary_elements = self.summary_template.generate_page(self.summary_data)
            #print(summary_elements)

            for element in summary_elements:
                try:
                    style = str(element.style)
                    #print(element, style)
                    #time.sleep(1)
                    
                    if 'Heading' in style:
                        text = element.text
                        level = int(style[-3])
                        entry_id = f"{text}_{self.entry_counter.get(text, 0)}"
                        #print((text, level, None, entry_id, len(self.elements)))
                        self.toc = [(text, level, None, entry_id, len(self.elements))] + self.toc
                        self.entry_counter[text] = self.entry_counter.get(text, 0) + 1
                        #break
                        
                except:
                    print(element, "doesn't have style")
            
            # Find the first PageBreak and insert summary elements after it
            new_elements = []
            page_break_found = False
            for element in self.elements:
                if isinstance(element, PageBreak) and not page_break_found:
                    new_elements.append(element)
                    new_elements.extend(summary_elements)
                    page_break_found = True
                else:
                    new_elements.append(element)

            #print(len(self.elements), len(new_elements))
                    
            self.elements = new_elements

    def add_element(self, element):
        #print("In PDF Gen's add_element")#, str(element))
        frame = Frame(self.doc.leftMargin, self.doc.bottomMargin, self.doc.width, self.current_page_height)
        element_height = element.wrap(frame._width, frame._height)[1]

        #print(f"Current page height: {self.current_page_height}, Element height: {element_height}")

        if self.current_page_height - element_height < 0 and not 'PageBreak' in str(element):
            self.elements.append(PageBreak())
            self.current_page_height = self.doc.height - self.doc.topMargin - self.doc.bottomMargin
            #print(f"Adding PageBreak. New page height after element: {self.current_page_height - element_height}")
            element_height = element.wrap(frame._width, self.current_page_height)[1]

        elif 'PageBreak' in str(element):
            #print(self.doc, self.page_size, self.doc.pagesize, frame._width, frame._height, self.doc.height)
            self.current_page_height = self.doc.height - self.doc.topMargin - self.doc.bottomMargin
            self.current_page_height += element_height

        self.current_page_height -= element_height
        self.elements.append(element)
        #print(f"Element added. Remaining page height: {self.current_page_height}\n")

    def add_title_page(self, title, author=""):
        self.add_element(Spacer(1, 2 * inch))
        self.add_element(Paragraph(title, self.styles['Title']))
        self.add_element(Spacer(1, 0.5 * inch))
        if author != "":
            self.add_element(Paragraph(f"Author: {author}", self.styles['Normal']))
            self.add_element(Spacer(1, 0.2 * inch))
        self.add_element(PageBreak())
        
    def add_heading(self, text, level=1):
        style = self.styles[f'Heading{level}']
        self.add_element(Paragraph(text, style))
        self.add_element(Spacer(1, 0.2 * inch))

        # Create a unique identifier for each TOC entry
        entry_id = f"{text}_{self.entry_counter.get(text, 0)}"
        self.toc.append((text, level, None, entry_id, len(self.elements)))
        self.entry_counter[text] = self.entry_counter.get(text, 0) + 1

    def add_paragraph(self, text):
        paragraph = Paragraph(text, self.styles['BodyText'])
        self.add_element(paragraph)
        #self.add_element(Spacer(1, 0.5 * inch))

    def add_table(self, data):
        table = Table(data, repeatRows=1)
        table.setStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.grey),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
            ('BACKGROUND', (0, 1), (-1, -1), colors.beige),
            ('GRID', (0, 0), (-1, -1), 1, colors.black),
        ])
        self.add_element(table)
        self.add_element(Spacer(1, 20))

    def add_image(self, image_path, width=4*inch, height=3*inch):
        img = Image(image_path, width, height)
        self.add_element(img)
        self.add_element(Spacer(1, 20))

    def add_code(self, code):
        self.add_element(Paragraph(f"<pre>{code}</pre>", self.styles['Code']))
        #self.add_element(Spacer(1, 20))

    def build_toc(self):
        # Step 1: Remove duplicates where page is None
        unique_entries = []
        for entry in self.toc:
            if entry[2] is None:
                if not any(e[0] == entry[0] for e in unique_entries):
                    unique_entries.append(entry)
            else:
                unique_entries.append(entry)
        
        self.toc = unique_entries
        #print("TOC:", self.toc)

        # Step 2: Update page numbers for entries with None
        for i, entry in enumerate(self.toc):
            current_page = 1
            if entry[2] is None:
                for element in self.elements:
                    if isinstance(element, PageBreak):
                        current_page += 1
                    if isinstance(element, Paragraph):
                        text = element.text
                        #print(current_page, text, entry[0], entry[0].strip(), entry[0].strip() in text)
                        if entry[0] in text or entry[0].strip() in text:
                            self.toc[i] = (entry[0], entry[1], current_page+1, entry[3], entry[4])
                            break
    

        toc_elements = [Paragraph("Table of Contents", self.styles['Title'])]
        toc_elements.append(Spacer(1, 0.5 * inch))
        #print("TOC:", self.toc)

        prev_level = 0
        
        for entry, level, page, _, _ in self.toc:
            style = self.styles[f'Heading{level+1}']
            indent_level = level * 10
            if level > prev_level:
                toc_elements.append(Indenter(left=indent_level))
            toc_elements.append(Paragraph(f"{entry} ............................. {page}", style))
            
            if level < prev_level:
                toc_elements.append(Indenter(left=-indent_level))

            prev_level = level

        toc_elements.append(PageBreak())
        #print(toc_elements)
        
        # Find the first PageBreak and insert the TOC elements after it
        new_elements = []
        page_break_found = False
        for element in self.elements:
            if isinstance(element, PageBreak) and not page_break_found:
                new_elements.append(element)
                new_elements.extend(toc_elements)
                page_break_found = True
            else:
                new_elements.append(element)
        self.elements = new_elements
        
    def update_toc_page_numbers(self, fn):
        try:
            doc = pymupdf.open(f"preview_{fn}.pdf")
        except:
            doc = pymupdf.open(fn)
        page_count = len(doc)
        #print("Page count:", page_count)
        
        last_updated_index = {}
        
        for i in range(page_count):
            page = doc.load_page(i)
            text = page.get_text("text")
            
            for j in range(len(self.toc)):
                entry, level, page_num, entry_id, elem_index = self.toc[j]
                #print(entry, f"TOC index: {j}, Pg: {i}", entry in text, page_num, (not (entry in last_updated_index)), last_updated_index)
                
                # Update only if page_num is None and if the entry has not been updated or the last updated index is less than the current index
                if page_num is None and entry in text and ((not (entry in last_updated_index)) or (last_updated_index[entry] < i)):
                    self.toc[j] = (entry, level, i + 2, entry_id, elem_index)
                    last_updated_index[entry] = i  # Update the last updated index for the entry
        
        doc.close()

    def add_page_number(self, canvas, doc):
        canvas.saveState()
        canvas.setFont('Helvetica', 10)
        page_number_text = f"{doc.page}"
        canvas.drawString(inch, 0.75 * inch, page_number_text)
        self.page_number += 1
        canvas.restoreState()

    def merge_pdfs(self, pdf_list, output_filename):
        merged_pdf = pymupdf.open()
        for pdf in pdf_list:
            pdf_document = pymupdf.open(pdf)
            for page in pdf_document:
                merged_pdf.insert_pdf(pdf_document, from_page=page.number, to_page=page.number)
        merged_pdf.save(output_filename)

    def remove_existing_toc(self, pdf_filename):
        pdf_document = pymupdf.open(pdf_filename)
        new_pdf = pymupdf.open()
        for page_num in range(len(pdf_document)):
            page = pdf_document.load_page(page_num)
            if "Table of Contents" in page.get_text("text"):
                continue
            new_pdf.insert_pdf(pdf_document, from_page=page_num, to_page=page_num)
        new_pdf.save(pdf_filename)

    def save(self):
        print(f"Saving PDF to {self.filename}")
        try:
            self.add_summary()
            temp_filename = "temp_summary.pdf"
            fn = self.preview(temp_filename)
            #webbrowser.open(os.path.join(os.getcwd(), fn))
            #self.doc.build(self.elements, onFirstPage=self.add_page_number, onLaterPages=self.add_page_number)
            #os.rename(self.filename, temp_filename)
            self.update_toc_page_numbers(fn)
            self.build_toc()
            #print(self.elements)
            indexes = []
            i = 0
            while i < len(self.elements) - 1:
                if isinstance(self.elements[i], PageBreak) and isinstance(self.elements[i + 1], PageBreak):
                    indexes.append(i + 1)
                    i += 2  # Skip the next element to avoid multiple consecutive removals
                else:
                    i += 1
        
            # Remove elements at the identified indexes
            for index in sorted(indexes, reverse=True):
                del self.elements[index]
            
            self.doc.build(self.elements, onFirstPage=self.add_page_number, onLaterPages=self.add_page_number)
            #os.remove(temp_filename)
        except Exception as e:
            print(f"Error saving PDF: {e}")
            raise(e)

    def preview(self, step_name):
        temp_filename = self.insert_filename_at_last_separator(step_name)
        print(f"Creating preview: {temp_filename}")
        try:
            preview_doc = SimpleDocTemplate(temp_filename, pagesize=self.page_size)
            preview_elements = list(self.elements)  # Copy current elements for preview
            preview_elements.insert(0, Paragraph(f"Preview - {step_name}", self.styles['Title']))
            preview_doc.build(preview_elements, onFirstPage=self.add_page_number, onLaterPages=self.add_page_number)
        except Exception as e:
            print(f"Error creating preview: {e}")

        return temp_filename

    def insert_filename_at_last_separator(self, step_name):
        """Insert preview and step name before the filename but after directory path."""
        # Get directory and filename
        directory = os.path.dirname(self.filename)
        base_name = os.path.basename(self.filename)
        
        if directory:
            # If there's a directory path, join everything together
            return os.path.join(directory, f"preview_{step_name}_{base_name}")
        else:
            # If no directory path, just prefix the filename
            return f"preview_{step_name}_{base_name}"