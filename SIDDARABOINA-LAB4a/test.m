eta = 0.01;
k = 8;
data = load('xor.txt');
[P_confusion_mat] = perceptron(data,eta,k)
[A_confusion_mat] = adaline(data,eta,k)