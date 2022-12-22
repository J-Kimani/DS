# Breast-Cancer-Surivial-prediction
Breast cancer survival prediction web application hosted on streamlit that determines the likelihood of a patient suffering from breast cancer surviving or dying. A python machine learning(xgboost) model is trained on data from kaggle datasets: https://www.kaggle.com/datasets/amandam1/breastcancerdataset. The data is for over a short period of time but is useful for hypothesisi testign and statistical analysis with over 400 rows.
The dataset consists of a group of breast cancer patients , who had surgery to remove their tumour. The following variables are required by our web application for effective prediction:

1. Age: Patients' age at diagnosis
2. Gender  encoded as {"MALE": 0, "FEMALE": 1}
3. Protein 1, 2, 3 and 4
4. Tumour stage: I, II, II encoded as {"I": 1, "II": 2, "III": 3}
5. Histology: encoded as {"Infiltrating Ductal Carcinoma": 1, "Infiltrating Lobular Carcinoma": 2, "Mucinous Carcinoma": 3}
6. ER status: refers to Estrogen receptor (ER) encoded as {"Positive": 1, "Negative": 2}
7. PR status: progesterone receptors encoded as {"Positive": 1, "Negative": 2}
8. HER2 status: human epidermal growth factor receptor 2 encoded as {"Positive": 1, "Negative": 2}
9. Surgery type: encoded as {"Other": 1, "Modified Radical Mastectomy": 2, "Lumpectomy": 3, "Simple Mastectomy": 4}

The web app the returns if the patient ia alive or dead.It only takes in categorical/ numerical values but later versions will allow for drop down list to allow the user select available options.
