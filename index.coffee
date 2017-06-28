###
author: Pradeep Patro <smartameer@icloud.com>
description: Commandlinefu random commands
###

###
frequency : 10 minutes
###
refreshFrequency: '10m'

style: """
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  text-shadow: 0 0 1px #0;
  font-family: -apple-system, Helvetica Neue;
  font-size: 13px;
  font-weight: 200;
  color: #ccc;

  .container
    padding: 8px 4px;
    background: rgba(#0, 0.85);

  .commandline
    padding-bottom: 4px;

  .term
    font-size: 14px;
    font-weight: 800;
    padding-left: 8px;
    color: #00f;

  .command
    color: #0f0;
    padding: 4px 8px;
    border-radius: 3px;

  .desc
    display: table-row;

  .desc > .help, .desc > .ref, .desc > .votes
    width: 60px;
    padding: 4px 4px 4px 44px;
    color: #f;
    font-family: monospace;
    display: table-cell;

  .summary, .url, .votecount
    display: table-cell;

  .url
    text-decoration: underline;

"""

command: 'curl -sb -H "Accept: application/json" -H "Content-Type: application/json" -X GET -L http://www.commandlinefu.com/commands/random/json'

render: () ->"""

  <div class="container">
    <div class="commandline">
      <strong class="term">&rarr; ~</strong>
      <code class="command"></code>
    </div>
    <p class="desc">
      <span class="help">--help</span><span class="summary"></span>
    </p>
    <p class="desc">
      <span class="ref">--ref</span><span class="url"></span>
    </p>
    <p class="desc">
      <span class="votes">--votes</span><span class="votecount"></span>
    </p>
  </div>

"""

update: (o, domEl) ->

  data = JSON.parse(o)[0];
  $(domEl).find('.command').html("#{data.command}");
  $(domEl).find('.summary').html("#{data.summary}");
  $(domEl).find('.url').html("#{data.url}");
  $(domEl).find('.votecount').html("#{data.votes}");
