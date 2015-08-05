package com.baobaotao.domain;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;


/**
 * 
 *<br><b>绫绘弿杩�</b>
 *<pre>鎵�ずPO鐨勭埗绫�/pre>
 *@see
 *@since
 */
public class BaseDomain implements Serializable
{
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
