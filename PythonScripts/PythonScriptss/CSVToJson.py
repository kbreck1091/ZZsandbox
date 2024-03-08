import csv
import json

def csv_to_json(csv_file_path, json_file_path):
    """
    Convert a CSV file to a JSON file.

    Parameters:
    - csv_file_path: The path to the input CSV file.
    - json_file_path: The path to the output JSON file.
    """
    data = []

    # Read CSV file and convert to a list of dictionaries
    with open(csv_file_path, 'r', encoding='utf-8') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            data.append(row)

    # Write JSON file
    with open(json_file_path, 'w', encoding='utf-8') as json_file:
        json.dump(data, json_file, indent=2)

# Example usage with directory parameters:
input_directory = 'C://DataSets/degrees/degrees/small'
output_directory = 'C://CsvToJson'

csv_filename = 'people.csv'
json_filename = 'people.json'

csv_path = f'{input_directory}/people.csv'
json_path = f'{output_directory}/people.json'

csv_to_json(csv_path, json_path)