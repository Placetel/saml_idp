module SecurityHelpers
  def fixture(document, base64 = true)
    response = Dir.glob(File.join(File.dirname(__FILE__), "responses", "#{document}*")).first
    if base64 && response =~ /\.xml$/
      Base64.encode64(File.read(response))
    else
      File.read(response)
    end
  end

  def response_document
    @response_document ||= File.read(File.join(File.dirname(__FILE__), 'responses', 'response1.xml.base64'))
  end

  def response_document_2
    @response_document2 ||= File.read(File.join(File.dirname(__FILE__), 'responses', 'response2.xml.base64'))
  end

  def response_document_3
    @response_document3 ||= File.read(File.join(File.dirname(__FILE__), 'responses', 'response3.xml.base64'))
  end

  def response_document_4
    @response_document4 ||= File.read(File.join(File.dirname(__FILE__), 'responses', 'response4.xml.base64'))
  end

  def response_document_5
    @response_document5 ||= File.read(File.join(File.dirname(__FILE__), 'responses', 'response5.xml.base64'))
  end

  def r1_response_document_6
    @response_document6 ||= File.read(File.join(File.dirname(__FILE__), 'responses', 'r1_response6.xml.base64'))
  end

  def response_document_7
    @response_document7 ||= File.read(File.join(File.dirname(__FILE__), 'responses', 'response7.xml.base64'))
  end

  def ampersands_response
    @ampersands_resposne ||= File.read(File.join(File.dirname(__FILE__), 'responses', 'response_with_ampersands.xml.base64'))
  end

  def response_document_6
    doc = Base64.decode64(response_document)
    doc.gsub!(/NotBefore=\"(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})Z\"/, "NotBefore=\"#{(Time.now-300).getutc.strftime("%Y-%m-%dT%XZ")}\"")
    doc.gsub!(/NotOnOrAfter=\"(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})Z\"/, "NotOnOrAfter=\"#{(Time.now+300).getutc.strftime("%Y-%m-%dT%XZ")}\"")
    Base64.encode64(doc)
  end

  def wrapped_response_2
    @wrapped_response_2 ||= File.read(File.join(File.dirname(__FILE__), 'responses', 'wrapped_response_2.xml.base64'))
  end

  def signature_fingerprint_1
    @signature_fingerprint1 ||= "C5:19:85:D9:47:F1:BE:57:08:20:25:05:08:46:EB:27:F6:CA:B7:83"
  end

  def signature_1
    @signature1 ||= File.read(File.join(File.dirname(__FILE__), 'certificates', 'certificate1'))
  end

  def r1_signature_2
    @signature2 ||= File.read(File.join(File.dirname(__FILE__), 'certificates', 'r1_certificate2_base64'))
  end
end
