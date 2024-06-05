import os
import requests

from pathlib import Path

class EnvConfig:
    access_token = ''
    endpoint = 'https://docs.example.com/_api/v3/page'
    dist = 'dist'

def get_page(file_path):
    if EnvConfig.access_token:
        params = {'access_token': EnvConfig.access_token, 'path': file_path}
    response = requests.get(EnvConfig.endpoint, params=params)
    
    data = response.json()
    return data

def page_exist(file_path):
    if EnvConfig.access_token:
        params = {'access_token': EnvConfig.access_token, 'path': file_path}
    response = requests.get(EnvConfig.endpoint + '/exist', params=params)
    
    data = response.json()
    return data

def push_page(file_path, sanitized_path):
    with open(file_path, 'r') as f:
        file_content = f.read()

        file_name = sanitized_path

        data = {'path': file_name, 'body': file_content}
        
        if EnvConfig.access_token:
            params = {'access_token': EnvConfig.access_token}
        response = requests.post(EnvConfig.endpoint, json=data, params=params)

        if response.status_code != 201:
            print(f'Error pushing {file_path} to API: {response.text}')

def update_page(page_id, revision_id, file_path):
    with open(file_path, 'r') as f:
        file_content = f.read()

        data = {'pageId': page_id, 'body': file_content, 'revisionId': revision_id}

        if EnvConfig.access_token:
            params = {'access_token': EnvConfig.access_token}
        response = requests.put(EnvConfig.endpoint, json=data, params=params)

        if response.status_code != 201:
            print(f'Error updating {page_id} to API: {response.text}')

def sanitize_path(file):
    path = os.path.join(root, Path(file).stem)

    return path.replace(EnvConfig.dist + '/', '/', 1)

for root, dirs, files in os.walk(EnvConfig.dist):
    for file in files:
        if file.endswith('.md'):
            path = os.path.join(root, file)
            sanitized_path = sanitize_path(file)

            page_exists = page_exist(sanitized_path)

            if page_exists['isExist']:
                page_data = get_page(sanitized_path)
                page_id = page_data['page']['_id']
                revision_id = page_data['page']['revision']['_id']

                update_page(page_id, revision_id, path)
            else:
                push_page(path, sanitized_path)

print('All files have been processed.')

# TODO
# add_toc() for all directories-page
