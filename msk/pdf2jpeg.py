"""
Converts an PDF to a JPEG file and optionally crops each page

Requires
 module: PyPDF2, pdf2image, PIL (subdependency)
 application: poppler (for pdf2image module)
"""

import sys

from PyPDF2 import PdfReader
import pdf2image

type Box = tuple[float, float, float, float]


def pdf_to_png(
    file, max_in_memory_pages=50, max_threads=2, area_to_crop: Box | None = None
):
    inputpdf = PdfReader(open(file, "rb"))
    max_pages = len(inputpdf.pages)
    counter = 1
    for page in range(1, max_pages, max_in_memory_pages):
        pil_images = pdf2image.convert_from_path(
            file,
            dpi=200,
            first_page=page,
            last_page=min(page + max_in_memory_pages - 1, max_pages),
            fmt="jpg",
            thread_count=max_threads,
            userpw=None,
            use_cropbox=False,
            strict=False,
        )

        print("\tprocessing", counter, "...", counter + len(pil_images) - 1)
        for image in pil_images:
            if area_to_crop:
                image = image.crop(area_to_crop)

            image.save(f"{str(counter).zfill(max_pages)}.jpg")
            counter += 1


def _find_arg(prefix, default, conversion):
    return next(
        (
            conversion(arg.removeprefix(prefix))
            for arg in sys.argv
            if arg.startswith(prefix)
        ),
        default,
    )


if __name__ == "__main__":
    if len(sys.argv) <= 1:
        print("Usage:")
        print(f"\tpython {sys.argv[0]} file [max-pages=<num>] [max-threads=<num>]")
        print("\t      [left=<float> top=<float> right=<float> bottom=<float>]")
        exit(1)

    _, file, *_ = sys.argv
    max_pages = _find_arg("max-pages=", 20, int)
    max_threads = _find_arg("max-threads=", 2, int)

    box_args = ["left=", "top=", "right=", "bottom="]
    box = tuple(_find_arg(arg, -1, float) for arg in box_args)
    if any(b == -1 for b in box):
        box = None

    pdf_to_png(file, max_pages, max_threads, area_to_crop=box)
