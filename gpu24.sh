#!/bin/bash
# Job name
# SBATCH --job-name GPU
# Submit to the gpu QoS, the requeue QoS can also be used for gpu's 
#SBATCH -q gpu
# Request one node
#SBATCH -N 1
# Total number of cores, in this example it will 1 node with 1 core each.
#SBATCH -n 1
# Request memory
#SBATCH --mem=16G
# Request 2 GPUs 
#SBATCH --gres=gpu:1
# Request v100 gpu 
#SBATCH --constraint=v100
# Mail when the job begins, ends, fails, requeues
#SBATCH --mail-type=ALL
# Where to send email alerts
# SBATCH --mail-user=gu3666@wayne.edu
# Create an output file that will be output_<jobid>.out
#SBATCH -o output_%j.out
# Create an error file that will be error_<jobid>.out
#SBATCH -e errors_%j.err
# Set maximum time limit
#SBATCH -t 1-4:0:0

# List assigned GPU: 
echo Assigned GPU: $CUDA_VISIBLE_DEVICES
# Check state of GPU: 
nvidia-smi

python3 exp_runner.py --mode train --conf ./confs/womask.conf --case data_DTU/dtu_scan24











