# extending from my own build/tag, make sure you build Auto-GPT with this tag
# autogpt-upstream
FROM autogpt-upstream:latest as autogpt-base

# Install additional apt packages if needed (coreutils as an example)
RUN apt-get update && apt-get install -y \
    coreutils


# Set a few environment variables 
ENV PIP_NO_CACHE_DIR=yes \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Install the required python packages globally
ENV PATH="$PATH:/root/.local/bin"

# Copy the requirements into the container
COPY requirements.txt .


# And install the requirements
RUN pip install --no-cache-dir -r requirements.txt
