#!/bin/bash

#conda activate chatglm_etuning
CUDA_VISIBLE_DEVICES=0 python ../src/train_bash.py \
    --stage sft \
    --do_eval \
    --dataset alpaca_gpt4_zh \
    --dataset_dir ../data \
    --checkpoint_dir ../models/ChatGLM3 \
    --output_dir ../output \
    --overwrite_cache \
    --per_device_eval_batch_size 8 \
    --max_samples 50 \
    --predict_with_generate
