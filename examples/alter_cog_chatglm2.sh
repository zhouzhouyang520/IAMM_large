#!/bin/bash

#CUDA_VISIBLE_DEVICES=$1 python ../src/train_bash.py \
#    --stage sft \
#    --model_name_or_path ../models/ChatGLM3 \
#    --do_train \
#    --dataset self_cognition \
#    --dataset_dir ../data \
#    --finetuning_type lora \
#    --output_dir ../checkpoint \
#    --overwrite_cache \
#    --per_device_train_batch_size 2 \
#    --gradient_accumulation_steps 2 \
#    --lr_scheduler_type cosine \
#    --logging_steps 10 \
#    --save_steps 1000 \
#    --warmup_steps 0 \
#    --learning_rate 1e-3 \
#    --num_train_epochs 20.0 \
#    --fp16

CUDA_VISIBLE_DEVICES=$1 python ../src/train_bash.py \
    --stage sft \
    --model_name_or_path ../models/ChatGLM3 \
    --do_predict \
    --dataset self_cognition \
    --checkpoint_dir ../checkpoint \
    --dataset_dir ../data \
    --output_dir output_self_cog \
    --overwrite_cache \
    --preprocessing_num_workers 1 \
    --per_device_eval_batch_size 8 \
    --predict_with_generate 
#\
#    --quantization_bit 4 \
#    --fp16

