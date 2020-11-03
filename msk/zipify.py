import os
import shutil

def get_folders():
	pwd = os.getcwd()
	folders = [f.path for f in os.scandir(pwd) if f.is_dir()]
	return folders
	
def zip_folder(folder):
	name = os.path.dirname(folder)
	filename = os.path.join(os.getcwd(), name)
	print('trying to zip ',  folder, '...')
	shutil.make_archive(filename, 'zip', folder)

def zip_folders():
	fs = get_folders()
	for f in fs:
		zip_folder(f + "\\")
		
zip_folders()
