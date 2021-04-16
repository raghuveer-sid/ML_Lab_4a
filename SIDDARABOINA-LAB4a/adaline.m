function [confusion_mat] = adaline(data,eta,k)
%ADALINE Summary of this function goes here
%   Detailed explanation goes here
if nargin < 2
    error('Insufficient inputs for perceptron')
end

n = length(data(:,1));
d = length(data(1,:))-1;


if k<2 || k>n
    error('K value is not supported')
end

if k==2
    [p,q] = size(data);
    P  = 0.5;
    idx = randperm(p);
    train = data(idx(1:round(P*p)),:) ; 
    test = data(idx(round(P*p)+1:end),:) ;
    test_set = test(:,end);

    %training

    l = 1;
    w = rand(1,d);
    while (l ~= 0)
        r = w*train(l,1:d).';
        %a = sign(r);
        delta = .5*(train(l,end)-r);
        dw = eta*delta*train(l,1:d);
        w = w + dw;
        l = l + 1;
        if (l>=n/2)
            l=0;
        end
    end
    %testing
    prediction = sign(test(:,1:d)*w.');
    if prediction(prediction == -1)
        prediction(prediction == -1) = false;
    end
    if test_set(test_set == -1)
        test_set(test_set == -1) = false;
    end
    confusion_mat = confusionmat(prediction,test_set);

end

if k>2 && k<n
    i = 1;
    m = k;
    for j = 1:n/k
        if m<n
            test = data(i:m,:) ;
            test_set = test(:,end);
            idx = ~ismember(data,test,'rows');
            train = data(idx,:);
            i = m+1;
            m = m + k;
            %
            l = 1;
            w = rand(1,d);
            while (l ~= 0 )
                r = w*train(l,1:d).';
                delta = .5*(train(l,end)-r);
                dw = eta*delta*train(l,1:d);
                w = w + dw;
                l = l + 1;
                if (l>length(train(:,1))) || (l>k)
                        l = 0;
                end
            end
            %testing
            prediction = sign(test(:,1:d)*w.');
            if prediction(prediction == -1)
                prediction(prediction == -1) = false;
            end
            if test_set(test_set == -1)
                test_set(test_set == -1) = false;
            end
            confusion_mat = confusionmat(prediction,test_set);
            confusion_mat = confusion_mat+confusion_mat;
        end
    end  
end

if k==n
    for j = 1:k
        test = data(j,:) ;
        test_set = test(:,end);
        idx = ~ismember(data,test,'rows');
        train = data(idx,:);
        l = 1;
        w = rand(1,d);
        while (l ~= 0 )
            r = w*train(l,1:d).';
            delta = .5*(train(l,end)-r);
            dw = eta*delta*train(l,1:d);
            w = w + dw;
            l = l + 1;
            if (l>length(train(:,1))) || (l>k)
                    l = 0;
            end
        end
        %testing
        prediction = sign(test(:,1:d)*w.');
        if prediction(prediction == -1)
            prediction(prediction == -1) = false;
        end
        if test_set(test_set == -1)
            test_set(test_set == -1) = false;
        end
        confusion_mat = confusionmat(prediction,test_set);
        confusion_mat = confusion_mat+confusion_mat;
    end
      
end

end

