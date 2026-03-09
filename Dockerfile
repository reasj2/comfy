FROM apmonej/tttwan:v0.14.2-cuda-12.9-py312

RUN test -f /workspace/ComfyUI/main.py

WORKDIR /workspace/ComfyUI

COPY custom_nodes/ /workspace/ComfyUI/custom_nodes/
COPY requirements.txt /workspace/ComfyUI/requirements.txt

RUN pip install -r /workspace/ComfyUI/requirements.txt
RUN find /workspace/ComfyUI/custom_nodes -name requirements.txt -exec pip install -r {} \; || true

RUN test -f /workspace/ComfyUI/main.py
