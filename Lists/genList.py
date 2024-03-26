import random
import string
from concurrent.futures import ThreadPoolExecutor
import os

def generate_custom_password(word_lists):
    word1, word2 = random.sample(word_lists, 2)
    digits = random.randint(1000, 99999)
    return f"{word1}{digits}{word2}"


def read_word_files(word_files):
    words = []
    for word_file in word_files:
        try:
            with open(word_file, 'r') as file:
                words.extend([line.strip() for line in file.readlines()])
        except FileNotFoundError:
            print(f"Word file not found at '{word_file}'. Please make sure the file exists.")
    return words

# Retrieve username
username = os.getenv('USER')
if username is None:
    print("Error: USER environment variable not set.")
    exit()

# Define the full file paths
file_directory = f"/home/{username}/Lists"
word_files = [
    os.path.join(file_directory, 'List1.txt'),
    os.path.join(file_directory, 'List2.txt')
]

# Define the number of passwords to generate
list_count = 1000 #random.randint(25000, 50000)

# Read word files
word_lists = read_word_files(word_files)

# Track progress
progress_list = []

# Generate passwords with progress
def generate_with_progress(_):
    password = generate_custom_password(word_lists)
    progress_list.append(1)
    progress = len(progress_list) / list_count * 100
    if progress % 10 == 0:  # Print progress every 10%
        print(f"Progress: {len(progress_list)}/{list_count} ({progress:.2f}%)")
    return password

# Define the output file path
output_file_path = f"/home/{username}/Lists/generated_passwords.txt"

# Delete existing output file
if os.path.exists(output_file_path):
    os.remove(output_file_path)

# Generate passwords using ThreadPoolExecutor
with ThreadPoolExecutor() as executor:
    passwords_list = list(executor.map(generate_with_progress, range(list_count)))

# Write generated passwords to the output file
with open(output_file_path, 'w') as output_file:
    output_file.write('\n'.join(passwords_list))

print(f"New passwords have been saved to {output_file_path}.")
