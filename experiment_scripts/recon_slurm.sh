#!/bin/bash
#SBATCH -t 5-23:59:59
#SBATCH --partition=nklab
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=25GB
#SBATCH --gres=gpu:QUADRORTX6000:1
# SBATCH --gres=gpu:1
# SBATCH --exclude=dgx001,dgx002,node001,node003,node004,node005,node006,node007,node008,node009,node010,node011,node012,node013,node014,node015,node016,node019,node024,node027,node037

nvidia-smi

source /mindhive/nklab4/users/tom/anaconda3/bin/activate
conda activate lfn

cd /mindhive/nklab4/users/tom/code/light-field-networks/experiment_scripts

CUDA_VISIBLE_DEVICES=0 python rec_nmr.py --data_root /om2/group/nklab/tom/image_sets/NMR_Dataset --checkpoint models/lfn_autodecoder_256/64_128_None/checkpoints/model_final.pth --viewlist viewlists/src_dvr.txt --experiment_name lfn_autodecoder_256_rec