from importlib.metadata import entry_points
from setuptools import setup

setup(
    name='exel',
    version='0.1.0',    
    description='Tool for changing exercism elixir parameters for vscode elixirls.',
    url='https://github.com/',
    author='Maksim Sukhanov',
    author_email='kakxow@gmail.com',
    license='GNU GPL v3.0',
    packages=['exel'],
    install_requires=[],
    entry_points={
        "console_scripts": [
            "exel=exel.exel:main"
        ]
    },

    classifiers=[ 
        'Operating System :: POSIX :: Linux',        
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.4',
        'Programming Language :: Python :: 3.5',
    ],
)