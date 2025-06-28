

```
sudo apt install nvidia-cuda-toolkit
nvcc --version
nvidia-smi

Linux > x86_64 > Ubuntu > 24.04 > deb (network)
https://developer.nvidia.com/cudnn-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=24.04&target_type=deb_network

```


```
sudo apt update && sudo apt upgrade -y
sudo apt install -y ffmpeg python3 python3-venv python3-dev python3-pip portaudio19-dev




mkdir whisperx
cd whisperx
python3 -m venv .venv
source .venv/bin/activate # use `deactivate` to exit the env


pip install --upgrade pip
pip install whisperx
# for latest version use `pip install git+https://github.com/m-bain/whisperX.git`

# (Optional) PyTorch with CUDA Support --–replace cu121 with `sudo apt install nvidia-cuda-toolkit` `nvcc --version`
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

python main.py

```