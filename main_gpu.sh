#!/bin/bash

# معلومات المحفظة
WALLET="4Aea3C3PCm6VcfUJ82g46G3iBwq59x8z6DYa4aM2E7QMC42vpTKARQfBwig1gEPSr3JufAayvqVs26CFuD7cwq7U2rPbeCR"   # ← غيّر هذا
WORKER="x"
POOL="152.53.121.6:443"

# إنشاء مجلد العمل
mkdir -p ~/xmrig_gpu && cd ~/xmrig_gpu

# تحميل XMRig
wget -O xmrig.tar.gz https://github.com/xmrig/xmrig/releases/latest/download/xmrig-*-linux-x64.tar.gz

# فك الضغط
tar -xvzf xmrig.tar.gz --strip=1
rm xmrig.tar.gz

# تشغيل XMRig مع GPU فقط (CUDA + OpenCL) + حفظ السجل
nohup ./xmrig -o $POOL -u $WALLET -p $WORKER -k --tls --cuda --opencl > gpu_output.log 2>&1 &

echo "✅ بدأ التعدين باستخدام GPU. راقب السجل: tail -f gpu_output.log"
