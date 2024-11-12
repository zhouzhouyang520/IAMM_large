from transformers import AutoTokenizer, AutoModel
path_to_save_model = "models/ChatGLM3"
tokenizer = AutoTokenizer.from_pretrained(path_to_save_model, trust_remote_code=True)
model = AutoModel.from_pretrained(path_to_save_model, trust_remote_code=True).half().cuda()
response, history = model.chat(tokenizer, "你是谁", history=[])
print(response)
