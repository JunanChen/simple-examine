package com.cdtu.simpleexamine.serializer;

import com.cdtu.simpleexamine.utils.TimeUtil;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;

/**
 * @author junan
 * @version V1.0
 * @className UnixConverterSerializer
 * @disc
 * @date 2019/11/30 22:09
 */
public class UnixConverterSerializer extends JsonSerializer<Integer> {

    @Override
    public void serialize(Integer integer, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
        String s = TimeUtil.timeStampToDate(String.valueOf(integer), null);
        jsonGenerator.writeString(s);
    }

}