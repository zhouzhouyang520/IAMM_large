#!/bin/bash

CUDA_VISIBLE_DEVICES=$1 python ../src/train_bash.py \
    --stage sft \
    --model_name_or_path ../models/ChatGLM3 \
    --do_train \
    --dataset ed_tra \
    --dataset_dir ../data/ed_json_data \
    --finetuning_type lora \
    --output_dir checkpoint/ed_checkpoint_sit_noLL \
    --overwrite_cache \
    --per_device_train_batch_size 12 \
    --gradient_accumulation_steps 2 \
    --lr_scheduler_type cosine \
    --logging_steps 10 \
    --save_steps 1000 \
    --warmup_steps 0 \
    --learning_rate 1e-3 \
    --num_train_epochs 3.0 \
    --quantization_bit 8 \
    --fp16

#    --quantization_bit 8 \
CUDA_VISIBLE_DEVICES=$1 python ../src/train_bash.py \
    --stage sft \
    --model_name_or_path ../models/ChatGLM3 \
    --do_predict \
    --dataset ed_tst \
    --dataset_dir ../data/ed_json_data \
    --checkpoint_dir checkpoint/ed_checkpoint_sit_noLL \
    --output_dir output/output_ed_sit_noLL \
    --overwrite_cache \
    --preprocessing_num_workers 1 \
    --per_device_eval_batch_size 12 \
    --fp16 \
    --predict_with_generate 
    --quantization_bit 8 \
##\
##    --quantization_bit 4 \
##    --fp16
python ed_scripts/cal_metrics.py
