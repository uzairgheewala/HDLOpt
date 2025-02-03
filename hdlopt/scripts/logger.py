import logging
import sys
from logging.handlers import RotatingFileHandler

logger = logging.getLogger("hdlopt")
logger.setLevel(logging.DEBUG)  

logger.propagate = False

if not logger.handlers:
    console_handler = logging.StreamHandler(sys.stderr)
    console_handler.setLevel(logging.INFO)  

    file_handler = RotatingFileHandler(
        "hdlopt.log", maxBytes=5 * 1024 * 1024, backupCount=3
    )
    file_handler.setLevel(logging.DEBUG)  

    formatter = logging.Formatter(
        "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
    )
    console_handler.setFormatter(formatter)
    file_handler.setFormatter(formatter)

    logger.addHandler(console_handler)
    logger.addHandler(file_handler)
