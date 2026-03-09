FROM apmonej/tttwan:v0.14.2-cuda-12.9-py312

WORKDIR /opt/comfyui-api-wrapper

COPY custom_nodes/ /opt/comfyui-api-wrapper/custom_nodes/
COPY requirements.txt /opt/comfyui-api-wrapper/requirements.txt

RUN pip install -r /opt/comfyui-api-wrapper/requirements.txt
RUN find /opt/comfyui-api-wrapper/custom_nodes -name requirements.txt -exec pip install -r {} \; || true
