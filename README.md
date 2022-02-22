# single-unit neural networks

# Task 1: Program two one-unit neural networks
This task consists of two functions namely Perceptron and Adaline.The effects of each function is
described below.
Both Perceptron and Adaline take two mandatory arguments namely a data with n x (d+1) size, a
scalar η(eta) which has a positive value and as suggested it was taken as less than one and an optional
argument k which ranges as 2≤k≤n and conditions for k in both functions is as follows.
• If k=2 then the data is split into one training set and one test set of equal size.
• If k=n then the data is split into n training sets in n possible ways.For this condition we perform
Leave on out cross validation.This method is discussed in below sections.
• If 2¡k¡n then we perform k-fold cross validation.This method is discussed in below sections.
• If k<2 or k>n then output an error message and abort the run.
For this task we use two types of datasets 1.MNIST dataset which is explained in previous sections.2.Iris
dataset which has n x 3 size.

#  Perceptron
The perceptron(or single-layer perceptron) is the simple model of a neuron that illustrates how a neural
network works. It is a network that takes an n number of inputs, carries out some processing on those inputs
and produces an output.The importance of this inputs is determined by the corresponding weights assigned
to this inputs. The output could be a 0 or a 1 depending on the weighted sum of the inputs. Output is 0 if
the sum is below certain threshold or 1 if the output is above certain threshold. This threshold could be a
real number and a parameter of the neuron.Since the output of the perceptron could be either 0 or 1, this
perceptron is an example of binary classifier.

# Adaline
Adaline uses continuous predicted values ,from the net input, to learn the model coefficients, which is
more “powerful” since it tells us by “how much” we were right or wrong.So, in the perceptron, we simply
use the predicted class labels to update the weights, and in Adaline, we use a continuous response.For this
function LMS algorithm is used.


