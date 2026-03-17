#!/bin/bash
#SBATCH --job-name=blender-job-anim
#SBATCH --output=blender_%A_%a.out 
#SBATCH -p plgrid
#SBATCH -A plglscclass26-cpu
#SBATCH -N 1
#SBATCH --ntasks-per-node=4
#SBATCH --mem-per-cpu=1GB
#SBATCH --array=1-100
module load blender

BLEND_FILE="repeat_zone_flower_by_MiRA.blend"
OUTPUT_PATH="./blender_output/"
OUTPUT_FORMAT="PNG"

n=${SLURM_ARRAY_TASK_ID}

# Render the animation using Blender's command-line interface
blender -b "$BLEND_FILE" -o "${OUTPUT_PATH}frame_" -F "$OUTPUT_FORMAT" -f "$n"

# Notify completion
echo "Rendering completed. Check the output at $OUTPUT_PATH"

