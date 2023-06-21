# Language Detector
Welcome to the Language Detection App! This application is built using Python and trained with the Multinomial Naive Bayes classifier, achieving an impressive accuracy of 96%. If you ever wondered what language a phrase or word belongs to, this app is here to assist you.

## Dataset
The app was trained using a dataset obtained from Kaggle. You can find the dataset at the following link: [Language Detection Dataset](https://www.kaggle.com/code/martinkk5575/language-detection/input). The dataset consists of phrases or words in various languages, with a total of 22 languages represented. The languages in the dataset include Estonian, Swedish, English, Russian, Romanian, Persian, Pushto, Spanish, Hindi, Korean, Chinese, French, Portuguese, Indonesian, Urdu, Latin, Turkish, Japanese, Dutch, Tamil, Thai, and Arabic.

## How It Works
To detect the language of a given phrase or word, simply input your text into the app. The input data is transformed using the CountVectorizer, which converts text into numerical features that can be used by the classifier. Once transformed, the app utilizes the trained Multinomial Naive Bayes classifier to predict the language of the input text. The output will be the detected language.

### *Illustration*
![image](https://github.com/J-Kimani/Language-Detector/assets/89415200/28a7676a-8c38-4870-836e-8b34d9a6b1a9)

## Future Enhancements
In the future, we plan to enhance the app by training it on larger datasets that include a more diverse range of languages. By incorporating more languages and expanding the dataset, we aim to achieve even greater accuracy in language detection. Stay tuned for the upcoming versions of the app!

Feel free to use this Language Detection App to explore and identify the languages behind various phrases and words. Enjoy!😁😎
