# Classical Gram-Schmidt with Reorthogonalization (cgs2)

## Overview
This repository contains a MATLAB function, `cgs2`, that implements the classical Gram-Schmidt with reorthogonalization algorithm. This function performs the QR factorization of an input matrix `X`. Additionally, it includes two test problems to validate its functionality.

## Program Functionality
The `cgs2` function takes an input matrix `X` and computes its QR factorization using the classical Gram-Schmidt with reorthogonalization algorithm. The resulting orthogonal matrix `Q` and upper triangular matrix `R` satisfy the equation: `X = Q * R`.

## Software Setup
Before running the program, you will need MATLAB or Octave installed on your system. Follow these steps to set up the software:

1. **Install MATLAB or Octave:**
   - If you have MATLAB, make sure it's installed and configured properly.
   - If you prefer to use Octave, you can download and install it from the [official Octave website](https://www.gnu.org/software/octave/).

2. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/cgs2-matlab.git
   ```

3. **Change Directory:**
   ```bash
   cd cgs2-matlab
   ```

## Running the Program
Follow these instructions to run the `cgs2` function and the provided test problems:

1. **Open MATLAB or Octave:**
   - Launch MATLAB or Octave on your computer.

2. **Load the `cgs2` Function:**
   - In the MATLAB or Octave console, navigate to the directory where you cloned this repository.

   ```matlab
   cd /path/to/cgs2-matlab
   ```

   - Load the `cgs2` function:

   ```matlab
   addpath(pwd)  % Add the current directory to the MATLAB path
   ```

3. **Run the Test Problems:**

   a. Läuchli Matrix Test:
   ```matlab
   % Generate the Läuchli matrix X
   X = [ones(1, 5); sqrt(eps) * eye(5)];

   % Compute the QR factorization using cgs2
   [Q, R] = cgs2(X);

   % Display the results
   disp('Q:');
   disp(Q);
   disp('R:');
   disp(R);
   disp('||X - QR||₂:');
   disp(norm(X - Q * R, 2));
   disp('||I₅ - QᵀQ||₂:');
   disp(norm(eye(5) - Q' * Q, 2));
   ```

   b. Polynomial Fitting Test:
   ```matlab
   % Generate data for polynomial fitting
   d = 0.5 * log(2);
   h = d / 10;
   x = (0:h:d)';
   b = exp(x);
   V = vander(x);
   X = V(:, 6:11);

   % Use cgs2 to solve for coefficients a
   a = cgs2(X, [X, b]);

   % Compute the error and its norm
   xx = (0:d / 100:d)';
   yy = polyval(a, xx);
   yexact = exp(xx);
   err = yexact - yy;
   err_norm = norm(err, Inf);

   % Display the error norm and plot the results
   disp('Error Norm (Inf):');
   disp(err_norm);

   % Plot the results
   figure;
   plot(xx, err);
   xlabel('x');
   ylabel('Error');
   title('Error vs. x');
   ```

## Notes
- Please ensure that you adhere to the academic integrity statement provided in this README. Copying, reproducing, or using any part of this work without proper citation and permission from the author is strictly prohibited.



# Academic Integrity Statement

Please note that all work included in this project is the original work of the author, and any external sources or references have been properly cited and credited. It is strictly prohibited to copy, reproduce, or use any part of this work without permission from the author.

If you choose to use any part of this work as a reference or resource, you are responsible for ensuring that you do not plagiarize or violate any academic integrity policies or guidelines. The author of this work cannot be held liable for any legal or academic consequences resulting from the misuse or misappropriation of this work.

Any unauthorized copying or use of this work may result in serious consequences, including but not limited to academic penalties, legal action, and damage to personal and professional reputation. Therefore, please use this work only as a reference and always ensure that you properly cite and attribute any sources or references used.

---
