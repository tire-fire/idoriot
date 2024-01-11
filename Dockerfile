# Use an official Ruby image as a parent image
FROM ruby:3.2.2

# Set the working directory inside the container
WORKDIR /idoriot

# Copy the Gemfile and Gemfile.lock into the container
COPY /idoriot/Gemfile /idoriot/Gemfile

# Install any needed packages specified in Gemfile
RUN bundle config set --local without 'development test'
RUN bundle install

# Copy the rest of your app's source code from your host to your image filesystem.
COPY ./idoriot /idoriot

RUN rake yard
RUN RAILS_ENV=production rake assets:precompile

# Make port 3000 available to the world outside this container
EXPOSE 3000

# Define the command to run your app using CMD which defines your runtime
CMD ["rails", "server", "-b", "0.0.0.0"]
