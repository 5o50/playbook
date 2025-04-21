import sys

def convert_line(line, is_header=False):
    columns = line.strip().split('\t')
    # Process image URL
    columns[0] = f'![]({columns[0]})'
    # Process product link
    columns[-1] = f'[Product]({columns[-1]})'
    # Bold headers if needed
    if is_header:
        columns = [f'**{col}**' for col in columns]
    return '| ' + ' | '.join(columns) + ' |'

# Read all lines
lines = sys.stdin.read().splitlines()

# Process header
header = convert_line(lines[0], is_header=True)
separator = '|' + '|'.join(['---' for _ in lines[0].split('\t')]) + '|'

# Process remaining lines
body = '\n'.join(convert_line(line) for line in lines[1:])

# Output full table
print(f'{header}\n{separator}\n{body}') 

# python3 csv_to_md.py < input.csv > output.md