package com.cdtu.simpleexamine.serializer;

import com.cdtu.simpleexamine.utils.TimeUtil;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

import java.io.IOException;

/**
 * @author junan
 * @version V1.0
 * @className UnixConverterDeSerializer
 * @disc
 * @date 2019/11/30 23:41
 */
public class UnixConverterDeSerializer extends JsonDeserializer<Integer> {

    @Override
    public Integer deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
        String text = jsonParser.getText();
        return Integer.valueOf(TimeUtil.simpleDateTotimeStamp(text));
    }
}