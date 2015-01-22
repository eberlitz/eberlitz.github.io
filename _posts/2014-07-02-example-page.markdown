---
layout: post
comments: false
title:  "Post title"
excerpt: "A nice post"
date:   2014-07-02 10:00:00
published:   true
---

# Introduction 

## What is Machine Learning?

Machine learning is a scientific discipline that explores the construction and study of algorithms that can learn from data. Such algorithms operate by building a model based on inputs and using that to make predictions or decisions, rather than following only explicitly programmed instructions.

Types of machine learning problems:

- Supervised Learning
- Unsupervised Learning
- Reinforcement learning
- Recommender systems

---

## Supervised Learning

Regression Problem

	Predict Continuous Valued output (like prices)

Classification Problem

	Predict discrete valued output (like 0 or 1)

---

## Unsupervised Learning

Training set 

**Notation**:

- \\( m \\) - Number of training examples
- \\( x’s \\) -  input variables/ features
- \\( y’s \\) - outuput variables / ‘target’ variables
- \\( (x,y) \\) - One training example
- \\( (x^(i),y^(i)) \\) - ith training example


## Hypothesis

## Linear regression model

$$
h_\theta (x) = \theta_0+\theta_1 x
$$

## Cost Function

Squared Error Cost Function:

$$
J(\theta_0,\theta_1) = \frac{1}{2m} \sum_{i=1}^{m}((h_\theta(x^i) - y^i))^2
$$

goal: 

min \theta_0\theta_1 J(\theta_0,\theta_1)

## Gradient descent

Used to minimize some cost function.

- Have a cost function \\( J(\theta_0,\theta_1) \\)
- Want \\( min \theta_0,\theta_1  J(\theta_0,\theta_1) \\)

Outline:

- Start with some \\( \theta_0,\theta_1 \\)
- Keep changing \\( \theta_0,\theta_1 \\) to reduce \\( J(\theta_0,\theta_1) \\) until end up at a minimum.

Algorithm


repeat until convergence {
$\theta_j := \theta_j - \alpha \frac{\partial}{\partial\theta_j} J(\theta_0,\theta_1)$ (for j = 0 and j = 1) 
}

where \alpha is the learning rate

## Gradient descent for linear regression

just resolve the partial derivative



## Normal eq and regularization









 randomly search
 numerical gradient
 analytic gradient






http://mathbin.herokuapp.com/gnwVgTA


http://karpathy.github.io/neuralnets/

Introduction to Deep Learning with Python (Theano)
https://www.youtube.com/watch?v=S75EdAcXHKk



Focar em algo prático

Montar um ambiente com todos os aparatos necessários
