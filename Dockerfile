# Base image
FROM python

#########
LABEL version="latest" maintainer="Enigma Camp <trainer@enigmacamp.com>"

# Install Robot Framework
RUN pip3 install robotframework==5.0.1
# Install Selenium library of Robot Framework 
RUN pip3 install robotframework-seleniumlibrary

# Create working directory
RUN mkdir /app

# Copy test files to working directory
COPY tests/basicChecks.robot /app

# Set the working directory
WORKDIR /app

# Set the entrypoint command
ENTRYPOINT ["robot", "--outputdir", "reports", "basicChecks.robot"]