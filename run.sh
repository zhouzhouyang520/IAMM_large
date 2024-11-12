#!/bin/sh

CUDA_VISIBLE_DEVICES=4 python src/train_web.py

##accelerate launch src/train_bash.py \
#CUDA_VISIBLE_DEVICES=1 python src/train_bash.py \
#    --stage sft \
#    --do_train \
#    --model_name_or_path models/ChatGLM2 \
#    --dataset self_cognition \
#    --finetuning_type lora \
#    --output_dir cognition \
#    --overwrite_cache \
#    --per_device_train_batch_size 2 \
#    --gradient_accumulation_steps 2 \
#    --lr_scheduler_type cosine \
#    --logging_steps 10 \
#    --save_steps 1000 \
#    --warmup_steps 0 \
#    --learning_rate 1e-3 \
#    --num_train_epochs 10.0 \
#    --fp16

