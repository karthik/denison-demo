# -------------------------- >>>>>>>>>>>>>>>>>>>>>>>>>>>>
# RIEM


# -------------------------- >>>>>>>>>>>>>>>>>>>>>>>>>>>>
# MAGICK


# -------------------------- >>>>>>>>>>>>>>>>>>>>>>>>>>>>
# TESSERACT

# The tesseract package provides R bindings Tesseract: a powerful optical
# character recognition (OCR) engine that supports over 100 languages. The
# engine is highly configurable in order to tune the detection algorithms and
# obtain the best possible results.
#
# Keep in mind that OCR (pattern recognition in general) is a very difficult
# problem for computers. Results will rarely be perfect and the accuracy rapidly
# decreases with the quality of the input image. But if you can get your input
# images to reasonable quality, Tesseract can often help to extract most of the
# text from the image.

library(tesseract)
eng <- tesseract("eng")
text <- tesseract::ocr("http://jeroen.github.io/images/testocr.png", engine = eng)
cat(text)

# The ocr_data() function returns all words in the image along with a bounding
# box and confidence rate.

results <- tesseract::ocr_data("http://jeroen.github.io/images/testocr.png", engine = eng)
print(results, n = 20)

tesseract_info()

# Preprocessing with Magick

# The accuracy of the OCR process depends on the quality of the input image. You
# can often improve results by properly scaling the image, removing noise and
# artifacts or cropping the area where the text exists. See tesseract wiki:
# improve quality for important tips to improve the quality of your input image.


book <- "https://i.imgur.com/ISZ5vfG.jpg"
eng <- tesseract("eng")
x <- tesseract::ocr(book, engine = eng)

# Reading from PDF

pngfile <- pdftools::pdf_convert('https://jeroen.github.io/images/ocrscan.pdf', dpi = 600)
text <- tesseract::ocr(pngfile)
cat(text)



# -------------------------- >>>>>>>>>>>>>>>>>>>>>>>>>>>>
# DRAKE


# -------------------------- >>>>>>>>>>>>>>>>>>>>>>>>>>>>