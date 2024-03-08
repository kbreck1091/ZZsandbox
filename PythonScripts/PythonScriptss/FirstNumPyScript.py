import numpy as np

# Create a NumPy array from a list of numbers
data = np.array([1, 2, 3, 4, 5])

# Display the original array
print("Original Array:")
print(data)

# Basic operations on the array
mean_value = np.mean(data)
sum_value = np.sum(data)
square_root = np.sqrt(data)
power_of_two = np.power(data, 2)

# Display the results
print("\nMean Value:", mean_value)
print("Sum Value:", sum_value)
print("Square Root:", square_root)
print("Power of Two:", power_of_two)

# Create a 2D array (matrix)
matrix_data = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])

# Display the 2D array
print("\n2D Array:")
print(matrix_data)

# Transpose the matrix
transposed_matrix = np.transpose(matrix_data)

# Display the transposed matrix
print("\nTransposed Matrix:")
print(transposed_matrix)
