"""OCR pendiente para los 13 PDFs sin texto extraído aún."""
import os, sys, glob, io, time
import fitz
from PIL import Image
import numpy as np
from rapidocr_onnxruntime import RapidOCR

ROOT = r"C:\Users\lua22\Desktop\creacionSoftware\BasedeDatosRemetys2.0"
PDF_DIR = os.path.join(ROOT, "remtysTesoreria")
OUT_DIR = os.path.join(ROOT, "ocr_raw")
os.makedirs(OUT_DIR, exist_ok=True)

PENDING = [
    "CONVENIO",
    "COPIA-CERTIFICADA-DE-TRASLADO-DE-DOMINIO",
    "COPIAS-SIMPLES-DE-IMPUESTO-PREDIAL",
    "CORRECCION-DE-DATOS-DE-TRASLADO-DE-DOMINIO",
    "CORRECCION-DE-MEDIDAS-Y-COLINDANCIAS",
    "DEGUELLO-EN-RASTRO",
    "ESTACIONAMIENTOS",
    "IMPUESTO-SOBRE-LA-ADQUISION-DE-INMUBELES-TRASLATIVA-DE-DOMINIO",
    "JUEGOS-MAQUINITAS",
    "LEVANTAMIENTO-TOPOGRAFICO-CATASTRAL",
    "PAGO-DEL-IMPUESTO-PREDIAL",
    "SUBDIVISION-LOTIFICACION",
    "VERIFICACION-DE-LINDEROS",
]

ocr = RapidOCR()

def pdf_to_text(pdf_path: str) -> str:
    doc = fitz.open(pdf_path)
    out = []
    for idx, page in enumerate(doc, start=1):
        pix = page.get_pixmap(dpi=250)
        img = Image.frombytes("RGB", (pix.width, pix.height), pix.samples)
        arr = np.array(img)
        result, _ = ocr(arr)
        out.append(f"===== PAGINA {idx} =====")
        if result:
            for _, text, _conf in result:
                out.append(text)
        out.append("")
    doc.close()
    return "\n".join(out)

for name in PENDING:
    pdf = os.path.join(PDF_DIR, name + ".pdf")
    if not os.path.exists(pdf):
        print(f"[SKIP missing] {name}")
        continue
    out_path = os.path.join(OUT_DIR, name + ".ocr.txt")
    if os.path.exists(out_path) and os.path.getsize(out_path) > 500:
        print(f"[SKIP done]   {name}")
        continue
    t0 = time.time()
    text = pdf_to_text(pdf)
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(text)
    print(f"[OK {time.time()-t0:5.1f}s] {name}  ({len(text)} chars)")

print("DONE")
