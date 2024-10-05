<?xml version="1.0" encoding="UTF-8"?>
<wsdl:definitions xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                  xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                  xmlns:xs="http://www.w3.org/2001/XMLSchema"
                  xmlns:tns="http://example.com/usuario"
                  targetNamespace="http://example.com/usuario">


    <!-- Descripción del servicio -->
    <documentation>
        Servicio para la gestión de recordatorios utilizando SOAP.
    </documentation>

    <!-- Tipos de datos -->
    <types>
        <xs:schema xmlns:tns="http://example.com/recordatorio" targetNamespace="http://example.com/recordatorio">
            <xs:complexType name="UsuarioType">
                <xs:sequence>
                    <xs:element name="UsuarioID" type="xs:string"/>
                    <xs:element name="Nombre" type="xs:string"/>
                    <xs:element name="Apellido" type="xs:string"/>
                    <xs:element name="CorreoElectronico" type="xs:string"/>
                    <xs:element name="FechaNacimiento" type="xs:date"/>
                    <xs:element name="Telefono" type="xs:string"/>
                    <xs:element name="CURP" type="xs:string"/>
                    <xs:element name="RFC" type="xs:string"/>
                </xs:sequence>
            </xs:complexType>

            <xs:complexType name="RecordatorioType">
                <xs:sequence>
                    <xs:element name="RecordatorioID" type="xs:string"/>
                    <xs:element name="CitaID" type="xs:string"/>
                    <xs:element name="UsuarioID" type="xs:string"/>
                    <xs:element name="fecha_recordatorio" type="xs:dateTime"/>
                    <xs:element name="mensaje" type="xs:string" minOccurs="0"/>
                </xs:sequence>
            </xs:complexType>

            <xs:complexType name="CrearRecordatorioRequestType">
                <xs:sequence>
                    <xs:element name="Recordatorio" type="tns:RecordatorioType"/>
                </xs:sequence>
            </xs:complexType>

            <xs:complexType name="CrearRecordatorioResponseType">
                <xs:sequence>
                    <xs:element name="Mensaje" type="xs:string"/>
                </xs:sequence>
            </xs:complexType>
        </xs:schema>
    </types>

    <!-- Mensajes -->
    <message name="CrearRecordatorioRequest">
        <part name="parameters" element="7"/>
    </message>

    <message name="CrearRecordatorioResponse">
        <part name="parameters" element="tns:CrearRecordatorioResponseType"/>
    </message>

    <!-- PortType - Definir las operaciones -->
    <portType name="RecordatorioPortType">
        <operation name="CrearRecordatorio">
            <input message="tns:CrearRecordatorioRequest"/>
            <output message="tns:CrearRecordatorioResponse"/>
        </operation>
    </portType>

    <!-- Enlace a SOAP -->
    <binding name="RecordatorioBinding" type="tns:RecordatorioPortType">
        <soap:binding style="document" transport="http://schemas.xmlsoap.org/soap/http"/>
        <operation name="CrearRecordatorio">
            <soap:operation soapAction="http://example.com/recordatorio/CrearRecordatorio"/>
            <input>
                <soap:body use="literal"/>
            </input>
            <output>
                <soap:body use="literal"/>
            </output>
        </operation>
    </binding>

    <!-- Servicio -->
    <service name="RecordatorioService">
        <port name="RecordatorioPort" binding="tns:RecordatorioBinding">
            <soap:address location="http://example.com/recordatorio"/>
        </port>
    </service>

</definitions>

