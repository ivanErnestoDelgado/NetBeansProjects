
package webservices;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the webservices package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _Registrar_QNAME = new QName("http://webservices/", "Registrar");
    private final static QName _RegistrarResponse_QNAME = new QName("http://webservices/", "RegistrarResponse");
    private final static QName _Validar_QNAME = new QName("http://webservices/", "Validar");
    private final static QName _ValidarResponse_QNAME = new QName("http://webservices/", "ValidarResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: webservices
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link Registrar }
     * 
     */
    public Registrar createRegistrar() {
        return new Registrar();
    }

    /**
     * Create an instance of {@link RegistrarResponse }
     * 
     */
    public RegistrarResponse createRegistrarResponse() {
        return new RegistrarResponse();
    }

    /**
     * Create an instance of {@link Validar }
     * 
     */
    public Validar createValidar() {
        return new Validar();
    }

    /**
     * Create an instance of {@link ValidarResponse }
     * 
     */
    public ValidarResponse createValidarResponse() {
        return new ValidarResponse();
    }

    /**
     * Create an instance of {@link Empleado }
     * 
     */
    public Empleado createEmpleado() {
        return new Empleado();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Registrar }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link Registrar }{@code >}
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "Registrar")
    public JAXBElement<Registrar> createRegistrar(Registrar value) {
        return new JAXBElement<Registrar>(_Registrar_QNAME, Registrar.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RegistrarResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link RegistrarResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "RegistrarResponse")
    public JAXBElement<RegistrarResponse> createRegistrarResponse(RegistrarResponse value) {
        return new JAXBElement<RegistrarResponse>(_RegistrarResponse_QNAME, RegistrarResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Validar }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link Validar }{@code >}
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "Validar")
    public JAXBElement<Validar> createValidar(Validar value) {
        return new JAXBElement<Validar>(_Validar_QNAME, Validar.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ValidarResponse }{@code >}
     * 
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link ValidarResponse }{@code >}
     */
    @XmlElementDecl(namespace = "http://webservices/", name = "ValidarResponse")
    public JAXBElement<ValidarResponse> createValidarResponse(ValidarResponse value) {
        return new JAXBElement<ValidarResponse>(_ValidarResponse_QNAME, ValidarResponse.class, null, value);
    }

}
