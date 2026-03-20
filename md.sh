#!/bin/bash
#SBATCH --job-name=Lysozyme_Sim
#SBATCH --partition=gpu-a100           
#SBATCH --mail-user=jsesate@tgen.org
#SBATCH --mail-type=BEGIN,END,FAIL     # Get notified for all job states
#SBATCH --nodes=1                      # Number of nodes
#SBATCH --ntasks=1                     # Total number of tasks
#SBATCH --cpus-per-task=4              # CPU cores per task (for multi-threading)
#SBATCH --gres=gpu:1                   # GPUs requested
#SBATCH --mem=20G                      # Memory (RAM) per node
#SBATCH --time=4:00:00                 # Wall clock time (D-HH:MM:SS)
#SBATCH --output=logs/%x_%j.out        # %x = Job Name, %j = Job ID.
#SBATCH --error=logs/%x_%j.err

# --- Environment Setup ---
module purge                           
module load Gromacs/2023.2-Container
module load CUDA/13.1.0

# --- Execution ---
echo "Running on host: $(hostname)"
echo "Started at: $(date)"

gmx mdrun -deffnm md_0_10

echo "Finished at: $(date)"




