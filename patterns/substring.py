from .base import Pattern
import os

class SubstringPattern(Pattern):
    def matches(self, filename):
        return self.pattern in filename

    def exact_match(self, filename):
        base_name = os.path.basename(filename)
        name_without_ext = os.path.splitext(base_name)[0]
        return self.pattern == name_without_ext

class Substring_CountPattern(Pattern):
    def __init__(self, pattern, count_vars={}):
        self.pattern = pattern
        self.count_vars = count_vars
        
    def matches(self, filename):
        count = filename.count(self.pattern)
        min_count, max_count = self.count_vars.get(self.pattern, (0, float('inf')))
        
        return min_count <= count < max_count