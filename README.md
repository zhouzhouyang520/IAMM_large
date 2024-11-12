# IAMM_large

## Code and data for ACL 2024: An Iterative Associative Memory Model for Empathetic Response Generation.


## Environment Installation
To run this code, you should：

1. Clone the project from github.
```sh
git clone https://github.com/zhouzhouyang520/IAMM_large.git
```

2. Make the directory 'models' and put LLM directory with model files (e.g., ChatGLM3/) into it:
```
mkdir models/
```

3. Enter the project root directory
```sh
cd IAMM_large/examples
```

4. Download the data, and put all the files into the directory data/ed_json_data/. [Baidu cloud link](https://pan.baidu.com/s/1IWqai_qW1_4ROTkQlKHwVA?pwd=rsih) with Code: rsih or [Google cloud link](https://drive.google.com/file/d/1mqc5kfpOEqYgFQIUqmjxZa0yidNPkhSA/view?usp=drive_link)

5. Run the code.
   ```
   sh run.sh
   ```

6. Results will be saved in either ./out.log or ./output/output_ed_sit/ed_result.txt
