class QgsSingleBandPseudoColorRenderer: QgsRasterRenderer
{
%TypeHeaderCode
    #include "qgssinglebandpseudocolorrenderer.h"
%End
  public:
    /**Note: takes ownership of QgsRasterShader*/
    QgsSingleBandPseudoColorRenderer( QgsRasterDataProvider* provider, int band, QgsRasterShader* shader /Transfer/ );
    ~QgsSingleBandPseudoColorRenderer();
    QgsRasterInterface * clone() const /Factory/;

    static QgsRasterRenderer* create( const QDomElement& elem, QgsRasterDataProvider* provider ) /Factory/;

    QgsRasterBlock * block( int bandNo, const QgsRectangle & extent, int width, int height ) / Factory /;

    /**Takes ownership of the shader*/
    void setShader( QgsRasterShader* shader /Transfer/ );
    QgsRasterShader* shader();
    const QgsRasterShader* constShader() const;
%MethodCode
      sipRes = sipCpp->shader();
%End

    void writeXML( QDomDocument& doc, QDomElement& parentElem ) const;

    void legendSymbologyItems( QList< QPair< QString, QColor > >& symbolItems ) const;

    QList<int> usesBands() const;

    double classificationMin() const;
    double classificationMax() const;
    void setClassificationMin( double min );
    void setClassificationMax( double max );
    int classificationMinMaxOrigin() const;
    void setClassificationMinMaxOrigin( int origin );

};
