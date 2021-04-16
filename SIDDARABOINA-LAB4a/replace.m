function [train_images, train_lables,test_images ,test_lables] = replace(number)

    train_lables = loadMNISTLabels('train-labels.idx1-ubyte');

    %train_lables = train_lables(1:600,:);

    train_images = transpose(loadMNISTImages('train-images.idx3-ubyte'));

    %train_images = train_images(1:600,:);

    test_lables = loadMNISTLabels('t10k-labels.idx1-ubyte');

    %test_lables = test_lables(1:100,:);

    test_images = transpose(loadMNISTImages('t10k-images.idx3-ubyte'));

    %test_images = test_images(1:100,:);

    if number ~= 0
        if train_lables(train_lables == number)
        train_lables(train_lables ~= number) = false;
        train_lables(train_lables == number) = true;
        end
        if test_lables(test_lables == number)
            test_lables(test_lables ~= number) = false;
            test_lables(test_lables == number) = true;
        end
    end

    if number == 0
        if train_lables(train_lables > number)
        train_lables(train_lables > number) = true;
        train_lables = ~ train_lables;
        end
        if test_lables(test_lables > number)
            test_lables(test_lables > number) = true;
            test_lables = ~ test_lables;
        end
    end   
end

