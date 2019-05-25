require 'slack'

# Slack操作クラス
class SlackService
  # 初期化
  #
  # @param [String] token APIトークン
  def initialize(token)
    @client = Slack::Client.new(token: token)
  end

  # メッセージを投稿
  #
  # @param [String] channel 投稿先のチャンネル名
  # @param [String] text 投稿するメッセージ
  # @param [String] thread_ts 投稿先スレッドのタイムスタンプ。指定なしの場合は新規投稿。
  def post_message(channel, text, thread_ts = nil)
    @client.chat_postMessage(
      channel: channel,
      text: text,
      thread_ts: thread_ts
    )
  end

  # リアクション（スタンプ）を追加
  #
  # @param [String] channel_id 追加先メッセージのチャンネルID
  # @param [String] name リアクション名（コロンは除く）
  # @param [String] timestamp 追加先メッセージのタイムスタンプ
  def add_reaction(channel_id, name, timestamp)
    response = @client.reactions_add(
      channel: channel_id,
      name: name,
      timestamp: timestamp
    )
    if response.has_key?('error')
      raise StandardError, "add_reaction failure. #{response['error']}" unless response['error'] == 'already_reacted'
    end

    response
  end
end
