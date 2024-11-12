import json
from evaluate import calc_distinct
import datetime
import math
 
def read_jsonl_file(file_path):
    res_data = []
    emo_count = 0.0
    emo_total = 0.0
    with open(file_path, 'r') as file:
        for line in file:
            line_json = json.loads(line)
            emotion = line_json["label"].split("\n ")[0].replace("[gMASK]sop Emotion:", "")
            predict = line_json["predict"].split("\n ")
            #print(f"line_json: {line_json}")
            pred_emotion = predict[0].replace("Emotion:", "")
            if len(predict) > 1:
                pred_response = predict[1].replace("Response:", "")  
            else:
                pred_response = "" 
            #print(f"emotion: {emotion}, pred_emotion: {pred_emotion}, pred_response: {pred_response}")
            #print(f"Greedy:{pred_response}")
            #print("===============================")
            emo_total += 1.0
            if emotion.lower() in pred_emotion.lower(): 
                emo_count += 1.0 
            res_data.append(pred_response)
    return emo_count, emo_total, res_data

def read_res_dict(file_path):
    with open(file_path, 'r') as f:
        data = json.load(f)
    #print(f"data: {data}")
    return data 
 
def cal_metrics():
    base_dir = "output/output_ed_sit/"
    file_path = base_dir + 'generated_predictions.jsonl'
    emo_count, emo_total, response_data = read_jsonl_file(file_path)
    emo_rate = emo_count / emo_total
    print(f"emo_count: {emo_count}, emo_total: {emo_total}, rate: {emo_rate}")
    d1, d2  = calc_distinct(response_data)
    print(f"Dist-1: {d1}, Dist-2: {d2}")

    res_file_path = base_dir + 'all_results.json'
    res_dict = read_res_dict(res_file_path)
    if "predict_loss" in res_dict:
        loss = res_dict["predict_loss"]
        ppl = math.exp(loss)
        print(f"loss: {loss}, ppl: {ppl}")
    else:
        loss, ppl = 0.0, 0.0
    out_path = base_dir + 'ed_result.txt'
    current_time = datetime.datetime.now()
    out_txt = f"{current_time}\tLoss\tPPL\tACC\tDist-1\tDist-2\n{loss}\t{ppl}\t{emo_rate}\t{d1}\t{d2}\n\n"
    with open(out_path, "a") as file: 
        file.write(out_txt) 
 
cal_metrics()
