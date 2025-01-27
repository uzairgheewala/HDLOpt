import logging
import sys
from logging.handlers import RotatingFileHandler

# Create a logger for the package
logger = logging.getLogger("hdlopt")
logger.setLevel(logging.DEBUG)  # Set the lowest level to capture all messages

# Prevent logging from propagating to the root logger multiple times
logger.propagate = False

# Check if handlers are already added to avoid duplicate logs
if not logger.handlers:
    # Console Handler - logs to stderr
    console_handler = logging.StreamHandler(sys.stderr)
    console_handler.setLevel(logging.DEBUG)  # Adjust as needed

    # File Handler - logs to a file with rotation
    file_handler = RotatingFileHandler(
        "hdlopt.log", maxBytes=5 * 1024 * 1024, backupCount=3
    )
    file_handler.setLevel(logging.DEBUG)  # Capture detailed logs

    # Create formatters and add them to handlers
    formatter = logging.Formatter(
        "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
    )
    console_handler.setFormatter(formatter)
    file_handler.setFormatter(formatter)

    # Add handlers to the logger
    logger.addHandler(console_handler)
    logger.addHandler(file_handler)
