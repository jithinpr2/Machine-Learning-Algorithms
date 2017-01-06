"""
__author__      = "Jithin Pradeep"
__version__     = "1.0"
__email__       = "jithinpr2@gmail.com"

Simple Batch Gradient descent algorithm implemenataion with LR
"""

import numpy as np
import random
from sklearn.datasets.samples_generator import make_regression
import pylab
from scipy import stats

def gradient_descent(gamma, x, y, numIterations):
    m = x.shape[0] # number of samples
    theta = np.ones(2)
    x_transpose = x.transpose()
    for iter in range(0, numIterations):
        hypothesis = np.dot(x, theta)
        loss = hypothesis - y
        cost = np.sum(loss ** 2) / (2 * m)  # cost
        print("iter %s | Cost function: %.3f" % (iter, cost))
        gradient = np.dot(x_transpose, loss) / m
        theta = theta - gamma * gradient  # update
    return theta

if __name__ == '__main__':

    x, y = make_regression(n_samples=100, n_features=1, n_informative=1,
                        random_state=0, noise=35)
    m, n = np.shape(x)
    x = np.c_[ np.ones(m), x] # insert column
    gamma = 0.01 # learning rate
    theta = gradient_descent(gamma, x, y, 1000)

    # plot
    for i in range(x.shape[1]):
        y_predict = theta[0] + theta[1]*x
    pylab.plot(x[:,1],y,'o')
    pylab.plot(x,y_predict,'k-')
    pylab.show()
    print ("Done!")
