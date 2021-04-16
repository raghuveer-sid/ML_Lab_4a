clc

clear
% Value of digit = choose 1 for iris and choose 2 for MNIST
digit = 2;

if digit ==1
    eta = 0.01;
    k = 30;
    data = load('iris-2class.txt');
    [P_confusion_mat] = perceptron(data,eta,k)
    figure()
    confusionchart(P_confusion_mat)
%     Precision_P = (P_confusion_mat(1,1)/(P_confusion_mat(1,1)+P_confusion_mat(1,2)));
    [A_confusion_mat] = adaline(data,eta,k)
    figure()
    confusionchart(A_confusion_mat)
%     Precision_A = (A_confusion_mat(1,1)/(A_confusion_mat(1,1)+A_confusion_mat(1,2)));

elseif digit == 2
    eta = 0.01;
    k = 2;
    y = zeros(10,2);
    for number = 0:9
        [train_images, train_lables,test_images, test_lables] = replace(number);
        data = [train_images train_lables;test_images test_lables];
        fprintf('For number = %d \n',number)
        [P_confusion_mat] = perceptron(data,eta,k)
%         figure()
%         confusionchart(P_confusion_mat)
        Precision_P = (P_confusion_mat(1,1)/(P_confusion_mat(1,1)+P_confusion_mat(1,2)))
        [A_confusion_mat] = adaline(data,eta,k)
%         figure()
%         confusionchart(A_confusion_mat)
        Precision_A = (A_confusion_mat(1,1)/(A_confusion_mat(1,1)+A_confusion_mat(1,2)))
        y(number+1,:) = [Precision_P;Precision_A]

    end
    numbers = 0:9;
    bar(numbers,y)    
else
    error('Please choose 1 for iris and 2 for MNIST')
end


