#!/bin/bash

#CUDA_VISIBLE_DEVICES=1 
#CUDA_VISIBLE_DEVICES=4 python ../src/train_bash.py \
CUDA_VISIBLE_DEVICES=2 accelerate launch ../src/train_bash.py \
    --stage sft \
    --do_train \
    --model_name_or_path ../models/ChatGLM3 \
    --dataset alpaca_gpt4_zh \
    --dataset_dir ../data \
    --finetuning_type lora \
    --output_dir output \
    --overwrite_cache \
    --per_device_train_batch_size 4 \
    --gradient_accumulation_steps 4 \
    --lr_scheduler_type cosine \
    --logging_steps 10 \
    --save_steps 1000 \
    --learning_rate 5e-5 \
    --num_train_epochs 3.0 \
    --quantization_bit 4 \
    --plot_loss \
    --fp16
