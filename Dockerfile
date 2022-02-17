# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/vscode/devcontainers/ruby:3 as development

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /opt/webapp

COPY Gemfile /opt/webapp/Gemfile
COPY Gemfile.lock /opt/webapp/Gemfile.lock

RUN mkdir -p /root/.vscode-server/extensions/connorshea.vscode-ruby-test-adapter-0.9.0/
COPY spec/custom_formatter.rb /root/.vscode-server/extensions/connorshea.vscode-ruby-test-adapter-0.9.0/custom_formatter.rb 

RUN bundle check || bundle install --jobs 4
# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
