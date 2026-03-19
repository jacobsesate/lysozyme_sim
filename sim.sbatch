#!/bin/bash

# --- 1. Basic Job Information ---
#SBATCH --job-name=js_lysozyme_sim
#SBATCH --partition=compute            # Change to 'gpu' or 'bigmem' if needed
#SBATCH --mail-user=jsesate@tgen.org
#SBATCH --mail-type=BEGIN,END,FAIL     # Get notified for all job states

# --- 2. Resource Allocation ---
# Best Practice: Request only what you need to move through the queue faster.
#SBATCH --nodes=1                      # Number of nodes
#SBATCH --ntasks=1                     # Total number of tasks
#SBATCH --cpus-per-task=4              # CPU cores per task (for multi-threading)
#SBATCH --mem=16G                      # Memory (RAM) per node
#SBATCH --time=24:00:00                # Wall clock time (D-HH:MM:SS)

# --- 3. Output Logging ---
# %x = Job Name, %j = Job ID. Helps keep your folder organized.
#SBATCH --output=logs/%x_%j.out
#SBATCH --error=logs/%x_%j.err

# --- 4. Environment Setup ---
module purge                           # Start with a clean slate

module load gromacs

# module load cuda/12.1                # Uncomment for GPU jobs

# --- 5. Execution ---
echo "Running on host: $(hostname)"
echo "Started at: $(date)"

# Use 'srun' within a script to benefit from Slurm's task management
srun python3 your_script.py --input data/samples/

echo "Finished at: $(date)"
