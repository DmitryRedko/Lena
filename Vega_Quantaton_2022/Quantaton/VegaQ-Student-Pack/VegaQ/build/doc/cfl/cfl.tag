<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile>
  <compound kind="file">
    <name>Brownian.hpp</name>
    <path>/home/elena/Рабочий стол/Quantaton/VegaQ-Student-Pack/VegaQ/cfl/</path>
    <filename>Brownian_8hpp.html</filename>
    <includes id="Slice_8hpp" name="Slice.hpp" local="yes" imported="no">Slice.hpp</includes>
    <includes id="GaussRollback_8hpp" name="GaussRollback.hpp" local="yes" imported="no">GaussRollback.hpp</includes>
    <includes id="Interp_8hpp" name="Interp.hpp" local="yes" imported="no">Interp.hpp</includes>
    <includes id="Ind_8hpp" name="Ind.hpp" local="yes" imported="no">Ind.hpp</includes>
    <member kind="typedef">
      <type>std::function&lt; Model(const std::vector&lt; double &gt; &amp;rVar, const std::vector&lt; double &gt; &amp;rEventTimes, double dInterval)&gt;</type>
      <name>TBrownian</name>
      <anchorfile>group__cflBrownian.html</anchorfile>
      <anchor>ga2edf757df6a07bf697cafa4d7420bd61</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>TBrownian</type>
      <name>brownian</name>
      <anchorfile>group__cflBrownian.html</anchorfile>
      <anchor>gaf620d03b7ad7046fee89b5ee9069d063</anchor>
      <arglist>(double dQuality, const GaussRollback &amp;rRollback=cfl::NGaussRollback::chain(), const Ind &amp;rInd=cfl::NInd::linear(), const Interp &amp;rInterp=cfl::NInterp::cspline())</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Data.hpp</name>
    <path>/home/elena/Рабочий стол/Quantaton/VegaQ-Student-Pack/VegaQ/cfl/</path>
    <filename>Data_8hpp.html</filename>
    <includes id="Function_8hpp" name="Function.hpp" local="yes" imported="no">cfl/Function.hpp</includes>
    <class kind="class">cfl::Data::CashFlow</class>
    <class kind="class">cfl::Data::Swap</class>
    <namespace>cfl::Data</namespace>
    <member kind="function">
      <type>Function</type>
      <name>discount</name>
      <anchorfile>namespacecfl_1_1Data.html</anchorfile>
      <anchor>a4575eaa8279c938412253e3ff6269413</anchor>
      <arglist>(double dYield, double dInitialTime)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>discount</name>
      <anchorfile>namespacecfl_1_1Data.html</anchorfile>
      <anchor>abbb1e8d9f7d299d60c846e5ae477a9a5</anchor>
      <arglist>(const Function &amp;rYield, double dInitialTime)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>volatility</name>
      <anchorfile>namespacecfl_1_1Data.html</anchorfile>
      <anchor>aa9561ed3f83762f4260324be1b70f45c</anchor>
      <arglist>(double dSigma, double dLambda, double dInitialTime)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>forward</name>
      <anchorfile>namespacecfl_1_1Data.html</anchorfile>
      <anchor>a2d070b6a8d3e7c19886dee13def2978b</anchor>
      <arglist>(double dSpot, double dCostOfCarry, double dInitialTime)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>forward</name>
      <anchorfile>namespacecfl_1_1Data.html</anchorfile>
      <anchor>abe01a2be0546fad89dc429c1c99139e8</anchor>
      <arglist>(double dSpot, const Function &amp;rCostOfCarry, double dInitialTime)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>forward</name>
      <anchorfile>namespacecfl_1_1Data.html</anchorfile>
      <anchor>ae8bb46ec753435fee82de68490d210b6</anchor>
      <arglist>(double dSpot, double dDividendYield, const Function &amp;rDiscount, double dInitialTime)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Error.hpp</name>
    <path>/home/elena/Рабочий стол/Quantaton/VegaQ-Student-Pack/VegaQ/cfl/</path>
    <filename>Error_8hpp.html</filename>
    <includes id="Macros_8hpp" name="Macros.hpp" local="yes" imported="no">cfl/Macros.hpp</includes>
    <class kind="class">cfl::Error</class>
    <namespace>cfl::NError</namespace>
    <member kind="function">
      <type>Error</type>
      <name>range</name>
      <anchorfile>namespacecfl_1_1NError.html</anchorfile>
      <anchor>a894a502c1601ee82feaadffd50b93002</anchor>
      <arglist>(const char *pWhere)</arglist>
    </member>
    <member kind="function">
      <type>Error</type>
      <name>sort</name>
      <anchorfile>namespacecfl_1_1NError.html</anchorfile>
      <anchor>a1eded1c862e839e80fb15a8ffbffcd67</anchor>
      <arglist>(const char *pWhere)</arglist>
    </member>
    <member kind="function">
      <type>Error</type>
      <name>size</name>
      <anchorfile>namespacecfl_1_1NError.html</anchorfile>
      <anchor>ac6ec8baaccb77da7ec8d57c2290a3a14</anchor>
      <arglist>(const char *pWhere)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Function.hpp</name>
    <path>/home/elena/Рабочий стол/Quantaton/VegaQ-Student-Pack/VegaQ/cfl/</path>
    <filename>Function_8hpp.html</filename>
    <includes id="Error_8hpp" name="Error.hpp" local="yes" imported="no">cfl/Error.hpp</includes>
    <class kind="class">cfl::IFunction</class>
    <class kind="class">cfl::Function</class>
    <member kind="function">
      <type>Function</type>
      <name>apply</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaefc6f748aa55ba9af5888fc5939165e3</anchor>
      <arglist>(const Function &amp;rF, const std::function&lt; double(double)&gt; &amp;rOp)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>apply</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga1aad160b1231eab45c51bcbfd4ebb6ed</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG, const std::function&lt; double(double, double)&gt; &amp;rOp)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga9002e8a5719a0e0f8641c07c2776c65f</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator+</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga791881014381dc9299817a8ee54c01a4</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator+</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaebb9ffd9ebdf865392443b29a8ca3e81</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator+</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaa2901a847a20fd95fce20b72d94608ca</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga780c9857fc017d7e7e0a189f37780853</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga89ab2b0065cd02be196a8eb8e2100bab</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga4b95eadaa3cd0c7555aa12ef099cb083</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator*</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga23508570c1c867b26314fef7b138ec8f</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator*</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga7724362a5921d2ca77728d86c99a76f7</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator*</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaa56f481d9efec745cc2441743735f56e</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator/</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga5a9609f238dcd27d489c120d300e8d2f</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator/</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaafb41bdcea13efa36de86fab86a8c8d7</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator/</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gadd70bb3e3d448678e90960b415fb253c</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>pow</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga0ad815989b496eb88418f0cfacb86a8b</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>abs</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga57c16d6a064f32801f2e623e316d2c08</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>exp</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga52c70d0f89df857c746bc8cd465b4492</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>log</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga7a3f02432f55b86da5cda89b0ba989ff</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>sqrt</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gad5d6807fd56f4f4d275aef884a1a4db6</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>GaussRollback.hpp</name>
    <path>/home/elena/Рабочий стол/Quantaton/VegaQ-Student-Pack/VegaQ/cfl/</path>
    <filename>GaussRollback_8hpp.html</filename>
    <includes id="Macros_8hpp" name="Macros.hpp" local="yes" imported="no">Macros.hpp</includes>
    <class kind="class">cfl::IGaussRollback</class>
    <class kind="class">cfl::GaussRollback</class>
    <namespace>cfl::NGaussRollback</namespace>
    <member kind="function">
      <type>cfl::GaussRollback</type>
      <name>expl</name>
      <anchorfile>namespacecfl_1_1NGaussRollback.html</anchorfile>
      <anchor>ad9e18bcdee87d682502d2689b666d28e</anchor>
      <arglist>(double dP=1./3.)</arglist>
    </member>
    <member kind="function">
      <type>cfl::GaussRollback</type>
      <name>impl</name>
      <anchorfile>namespacecfl_1_1NGaussRollback.html</anchorfile>
      <anchor>ae9a6862c4cdc1805a9a526aa9c5ca69b</anchor>
      <arglist>(double dP=1.)</arglist>
    </member>
    <member kind="function">
      <type>cfl::GaussRollback</type>
      <name>crankNicolson</name>
      <anchorfile>namespacecfl_1_1NGaussRollback.html</anchorfile>
      <anchor>ae1995420ebcc55f71d064bca177e46b1</anchor>
      <arglist>(double dR=1.)</arglist>
    </member>
    <member kind="function">
      <type>cfl::GaussRollback</type>
      <name>fft2</name>
      <anchorfile>namespacecfl_1_1NGaussRollback.html</anchorfile>
      <anchor>a3b15b9e1f927b14a251fdabd81350c03</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cfl::GaussRollback</type>
      <name>fft</name>
      <anchorfile>namespacecfl_1_1NGaussRollback.html</anchorfile>
      <anchor>a21e0d890666f7b1d3d0a430a8ec65d95</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cfl::GaussRollback</type>
      <name>chain</name>
      <anchorfile>namespacecfl_1_1NGaussRollback.html</anchorfile>
      <anchor>a5d10f98159a03792e025e977311ff6c7</anchor>
      <arglist>(unsigned iExplSteps, const cfl::GaussRollback &amp;rFast, unsigned iImplSteps, double dExplP=1./3., double dImplP=1.)</arglist>
    </member>
    <member kind="function">
      <type>cfl::GaussRollback</type>
      <name>chain</name>
      <anchorfile>namespacecfl_1_1NGaussRollback.html</anchorfile>
      <anchor>a684370ae5005a3a264cbb163a82f20bd</anchor>
      <arglist>(const char *sFastScheme=&quot;fft2&quot;)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>HullWhiteModel.hpp</name>
    <path>/home/elena/Рабочий стол/Quantaton/VegaQ-Student-Pack/VegaQ/cfl/</path>
    <filename>HullWhiteModel_8hpp.html</filename>
    <includes id="Data_8hpp" name="Data.hpp" local="yes" imported="no">cfl/Data.hpp</includes>
    <includes id="Brownian_8hpp" name="Brownian.hpp" local="yes" imported="no">cfl/Brownian.hpp</includes>
    <includes id="InterestRateModel_8hpp" name="InterestRateModel.hpp" local="yes" imported="no">cfl/InterestRateModel.hpp</includes>
    <class kind="class">cfl::HullWhite::Data</class>
    <namespace>cfl::HullWhite</namespace>
    <member kind="function">
      <type>Data</type>
      <name>makeData</name>
      <anchorfile>namespacecfl_1_1HullWhite.html</anchorfile>
      <anchor>aa94b4e87ccfbeb48c2892097043bc776</anchor>
      <arglist>(const Function &amp;rDiscount, const Function &amp;rVolatility, const Function &amp;rShape, double dInitialTime)</arglist>
    </member>
    <member kind="function">
      <type>Data</type>
      <name>makeData</name>
      <anchorfile>namespacecfl_1_1HullWhite.html</anchorfile>
      <anchor>a58106344a5c0d56eac7ec2862798896a</anchor>
      <arglist>(const Function &amp;rDiscount, double dKappa, double dLambda, double dInitialTime)</arglist>
    </member>
    <member kind="function">
      <type>InterestRateModel</type>
      <name>model</name>
      <anchorfile>namespacecfl_1_1HullWhite.html</anchorfile>
      <anchor>a307446e9eb7f760c5fd5f2a4b456bda0</anchor>
      <arglist>(const Data &amp;rData, double dInterval, double dQuality)</arglist>
    </member>
    <member kind="function">
      <type>InterestRateModel</type>
      <name>model</name>
      <anchorfile>namespacecfl_1_1HullWhite.html</anchorfile>
      <anchor>a5df87f5e3547bb45638a892f4047ddec</anchor>
      <arglist>(const Data &amp;rData, double dInterval, const TBrownian &amp;rBrownian)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Ind.hpp</name>
    <path>/home/elena/Рабочий стол/Quantaton/VegaQ-Student-Pack/VegaQ/cfl/</path>
    <filename>Ind_8hpp.html</filename>
    <includes id="Error_8hpp" name="Error.hpp" local="yes" imported="no">cfl/Error.hpp</includes>
    <class kind="class">cfl::IInd</class>
    <class kind="class">cfl::Ind</class>
    <namespace>cfl::NInd</namespace>
    <member kind="function">
      <type>cfl::Ind</type>
      <name>naive</name>
      <anchorfile>namespacecfl_1_1NInd.html</anchorfile>
      <anchor>acee018ab22dc192a43722c66d976e370</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cfl::Ind</type>
      <name>linear</name>
      <anchorfile>namespacecfl_1_1NInd.html</anchorfile>
      <anchor>ac051330b9ab286b624e8474cfd039b07</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cfl::Ind</type>
      <name>quadratic</name>
      <anchorfile>namespacecfl_1_1NInd.html</anchorfile>
      <anchor>a3d4fc17aadd424d3dd71d65c71975ac5</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Index.hpp</name>
    <path>/home/elena/Рабочий стол/Quantaton/VegaQ-Student-Pack/VegaQ/cfl/</path>
    <filename>Index_8hpp.html</filename>
  </compound>
  <compound kind="file">
    <name>InterestRateModel.hpp</name>
    <path>/home/elena/Рабочий стол/Quantaton/VegaQ-Student-Pack/VegaQ/cfl/</path>
    <filename>InterestRateModel_8hpp.html</filename>
    <includes id="Slice_8hpp" name="Slice.hpp" local="no" imported="no">cfl/Slice.hpp</includes>
    <class kind="class">cfl::IInterestRateModel</class>
    <class kind="class">cfl::InterestRateModel</class>
  </compound>
  <compound kind="file">
    <name>Interp.hpp</name>
    <path>/home/elena/Рабочий стол/Quantaton/VegaQ-Student-Pack/VegaQ/cfl/</path>
    <filename>Interp_8hpp.html</filename>
    <includes id="Function_8hpp" name="Function.hpp" local="yes" imported="no">cfl/Function.hpp</includes>
    <class kind="class">cfl::IInterp</class>
    <class kind="class">cfl::Interp</class>
    <namespace>cfl::NInterp</namespace>
    <member kind="function">
      <type>cfl::Interp</type>
      <name>linear</name>
      <anchorfile>namespacecfl_1_1NInterp.html</anchorfile>
      <anchor>a67d5187b35fd70ff9dbf47d6e134f13a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cfl::Interp</type>
      <name>cspline</name>
      <anchorfile>namespacecfl_1_1NInterp.html</anchorfile>
      <anchor>ab54103b1f47c1f0a051d21b6d657639e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cfl::Interp</type>
      <name>steffen</name>
      <anchorfile>namespacecfl_1_1NInterp.html</anchorfile>
      <anchor>ab908196af34b402103397d8b5894f501</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cfl::Interp</type>
      <name>akima</name>
      <anchorfile>namespacecfl_1_1NInterp.html</anchorfile>
      <anchor>ab5fe5612a3ac6d3e18991a9d70384056</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cfl::Interp</type>
      <name>polynomial</name>
      <anchorfile>namespacecfl_1_1NInterp.html</anchorfile>
      <anchor>a9546b3626f5dfb8ff616bff8228e8354</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Macros.hpp</name>
    <path>/home/elena/Рабочий стол/Quantaton/VegaQ-Student-Pack/VegaQ/cfl/</path>
    <filename>Macros_8hpp.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>PRECONDITION</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>gad98dcd871dcffebd5a39802226a429b1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>ASSERT</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>gaf343b20373ba49a92fce523e948f2ab3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>POSTCONDITION</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>ga41c215e9b1a35b82ddacbdbd2dfd707d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const double</type>
      <name>EPS</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>gae4eb6817537ee44fb52f581538da5ee7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const unsigned</type>
      <name>IMAX</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>ga9af89fe2818b01bb5fc41f307a9fcee1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const double</type>
      <name>EPS</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>gae4eb6817537ee44fb52f581538da5ee7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const unsigned</type>
      <name>IMAX</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>ga9af89fe2818b01bb5fc41f307a9fcee1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const double</type>
      <name>EPS</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>gae4eb6817537ee44fb52f581538da5ee7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const unsigned</type>
      <name>IMAX</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>ga9af89fe2818b01bb5fc41f307a9fcee1</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Model.hpp</name>
    <path>/home/elena/Рабочий стол/Quantaton/VegaQ-Student-Pack/VegaQ/cfl/</path>
    <filename>Model_8hpp.html</filename>
    <includes id="MultiFunction_8hpp" name="MultiFunction.hpp" local="yes" imported="no">cfl/MultiFunction.hpp</includes>
    <class kind="class">cfl::IModel</class>
    <class kind="class">cfl::Model</class>
  </compound>
  <compound kind="file">
    <name>MultiFunction.hpp</name>
    <path>/home/elena/Рабочий стол/Quantaton/VegaQ-Student-Pack/VegaQ/cfl/</path>
    <filename>MultiFunction_8hpp.html</filename>
    <includes id="Function_8hpp" name="Function.hpp" local="yes" imported="no">cfl/Function.hpp</includes>
    <class kind="class">cfl::IMultiFunction</class>
    <class kind="class">cfl::MultiFunction</class>
    <member kind="function">
      <type>MultiFunction</type>
      <name>apply</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga5247e31632f9710cbbf9accfe834383e</anchor>
      <arglist>(const MultiFunction &amp;rF, const std::function&lt; double(double)&gt; &amp;rOp)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>apply</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>gaf3137b36af4def0bef224625158b1ee2</anchor>
      <arglist>(const MultiFunction &amp;rF, const MultiFunction &amp;rG, const std::function&lt; double(double, double)&gt; &amp;rOp)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator-</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga40f53303aea62d73fc853819ed6e5837</anchor>
      <arglist>(const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator+</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga37338e31a6a4f8f2905551ab72fb9c8b</anchor>
      <arglist>(const MultiFunction &amp;rF, const MultiFunction &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator+</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>gacfd17352434d3815e3db45028ecf1a18</anchor>
      <arglist>(const MultiFunction &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator+</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga17b936b13bc246df5bfd4bc11fba6791</anchor>
      <arglist>(double dV, const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator-</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga34d84ccc5639453caed3df61e7851b90</anchor>
      <arglist>(const MultiFunction &amp;rF, const MultiFunction &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator-</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>gac2de7180a86332c72defc54d89ccf0ea</anchor>
      <arglist>(const MultiFunction &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator-</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>gadbb2599723603e89c6479675f3b27201</anchor>
      <arglist>(double dV, const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator*</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>gaef6a511dd49168f6ba0552d932160954</anchor>
      <arglist>(const MultiFunction &amp;rF, const MultiFunction &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator*</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>gaf96b53e2581d663f660be10cceb4d939</anchor>
      <arglist>(const MultiFunction &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator*</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga715f406b62c8850e1afccf93d0f31a03</anchor>
      <arglist>(double dV, const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator/</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga2659b4388ba89c590e871545cc1f9c24</anchor>
      <arglist>(const MultiFunction &amp;rF, const MultiFunction &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator/</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>gaa277497fea39fc9bf6e5253761a0fd9c</anchor>
      <arglist>(const MultiFunction &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator/</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga12a036f1c869d65a4900f5b2bb2420da</anchor>
      <arglist>(double dV, const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>pow</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga92da3fb0054e172cdde524a7d95f0781</anchor>
      <arglist>(const MultiFunction &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>abs</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga22c909396db6796296bc88664fe3ca05</anchor>
      <arglist>(const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>exp</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga4533cffaa9d943f0d499cd326f9cad7a</anchor>
      <arglist>(const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>log</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga7be7274a542c736132f5b2dc6973df04</anchor>
      <arglist>(const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>sqrt</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga3d3bb4ca7588f011089ac5930ff5ef9e</anchor>
      <arglist>(const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>toMultiFunction</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga14973cccaa304063c3b3203362e6f965</anchor>
      <arglist>(const Function &amp;rF, unsigned iArg, unsigned iDim)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>toMultiFunction</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga6efeec5029b76cd45ad07b114a445d79</anchor>
      <arglist>(const MultiFunction &amp;rF, const std::vector&lt; unsigned &gt; &amp;rArg, const std::valarray&lt; double &gt; &amp;rOtherArg)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>toFunction</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga21229af02dbb2bbfbbf365d0de718073</anchor>
      <arglist>(const MultiFunction &amp;rF, unsigned iArg=0, const std::valarray&lt; double &gt; &amp;rOtherArg=std::valarray&lt; double &gt;())</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Similar.hpp</name>
    <path>/home/elena/Рабочий стол/Quantaton/VegaQ-Student-Pack/VegaQ/cfl/</path>
    <filename>Similar_8hpp.html</filename>
    <includes id="Model_8hpp" name="Model.hpp" local="no" imported="no">cfl/Model.hpp</includes>
    <member kind="typedef">
      <type>std::function&lt; void(Slice &amp;rSlice, unsigned iEventTime)&gt;</type>
      <name>TRollback</name>
      <anchorfile>group__cflSimilar.html</anchorfile>
      <anchor>gaa2dae5e9fc241dc53a9c479f5174b492</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>Model</type>
      <name>similar</name>
      <anchorfile>group__cflSimilar.html</anchorfile>
      <anchor>ga567f1b883accd62da57a2db6068d1e25</anchor>
      <arglist>(const TRollback &amp;rTargetRollback, const Model &amp;rBase)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Slice.hpp</name>
    <path>/home/elena/Рабочий стол/Quantaton/VegaQ-Student-Pack/VegaQ/cfl/</path>
    <filename>Slice_8hpp.html</filename>
    <includes id="Model_8hpp" name="Model.hpp" local="yes" imported="no">cfl/Model.hpp</includes>
    <includes id="Error_8hpp" name="Error.hpp" local="yes" imported="no">cfl/Error.hpp</includes>
    <class kind="class">cfl::Slice</class>
    <member kind="function">
      <type>Slice</type>
      <name>operator-</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga80f495b02da87961b2c803c54e405811</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator+</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga374fd57ec7c3e05ddd47edee8b0e7157</anchor>
      <arglist>(const Slice &amp;rSlice1, const Slice &amp;rSlice2)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator-</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gac0c91efe72add419674ea493f91cb017</anchor>
      <arglist>(const Slice &amp;rSlice1, const Slice &amp;rSlice2)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator*</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga0da7ecbc5dc94b694402a27af67dc9f6</anchor>
      <arglist>(const Slice &amp;rSlice1, const Slice &amp;rSlice2)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator/</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gae399586e7aa20aaebae61bd6c774692e</anchor>
      <arglist>(const Slice &amp;rSlice1, const Slice &amp;rSlice2)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator+</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga01add91d64e3235c3b4b34a0a6b5b0f3</anchor>
      <arglist>(const Slice &amp;rSlice, double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator-</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gaba5e3d5fbd8f14f61c017ab462b2071b</anchor>
      <arglist>(const Slice &amp;rSlice, double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator*</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga24c5cbf84abb6e37e0576a084dcbfbca</anchor>
      <arglist>(const Slice &amp;rSlice, double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator/</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga92ba954ea1102aa0c0952b023ba70c81</anchor>
      <arglist>(const Slice &amp;rSlice, double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator+</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gae5bd3d942f6971cd07bdde472f76b39a</anchor>
      <arglist>(double dValue, const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator-</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga5d2ccb038b1427bef1d7824649cdb525</anchor>
      <arglist>(double dValue, const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator*</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga7fab9bed11d2ca0f41df8364ca69c1eb</anchor>
      <arglist>(double dValue, const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator/</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga620911ee6d11c3c11c4667c36e157312</anchor>
      <arglist>(double dValue, const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>max</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gaeda8222b946329347f90331853ea69ed</anchor>
      <arglist>(const Slice &amp;rSlice, double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>min</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gad04503952a9d5381cb88417a8c023897</anchor>
      <arglist>(const Slice &amp;rSlice, double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>max</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga1c74f2959de24e1d2bf7a6a293dcc3fb</anchor>
      <arglist>(const Slice &amp;rSlice1, const Slice &amp;rSlice2)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>min</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga1876c62ab5036a5438ff9d0eb2251779</anchor>
      <arglist>(const Slice &amp;rSlice1, const Slice &amp;rSlice2)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>max</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga82e23642163851ad945a6e3ac666e1db</anchor>
      <arglist>(double dValue, const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>min</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga1f819b430a1b7bca0b596ec90e327422</anchor>
      <arglist>(double dValue, const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>pow</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga0cdcad478e76343a9b4ad5894302c389</anchor>
      <arglist>(const Slice &amp;rSlice, double dPower)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>abs</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga3f134283a0d917b9316eb9fd6f3723a1</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>exp</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga9ec23cfc4580415b7313224a982c3ed7</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>log</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gaeffb5d137589b9703437f7a51fd526c4</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>sqrt</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga45a120b4337e064ad058c7af07a56ddc</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>indicator</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga9e139c90bce3cf4f84449e01c2711279</anchor>
      <arglist>(const Slice &amp;rSlice, double dBarrier)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>indicator</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga1070cddc9a59774bf2ebc8ba05bb4036</anchor>
      <arglist>(double dBarrier, const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>indicator</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga5c8dc0ed13dcf2781e738df39cef9021</anchor>
      <arglist>(const Slice &amp;rSlice, const Slice &amp;rBarrier)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>rollback</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga5236ca42033ba7cc1ea8ee451c65ff66</anchor>
      <arglist>(const Slice &amp;rSlice, unsigned iEventTime)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>interpolate</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga292415bb3151ad35ca7847c35138c254</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>interpolate</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gae646e527786dfb3623a723e12e6fe884</anchor>
      <arglist>(const Slice &amp;rSlice, const std::vector&lt; unsigned &gt; &amp;rState)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>interpolate</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga603b7c7732e23b656b4ccc17451001ce</anchor>
      <arglist>(const Slice &amp;rSlice, unsigned iStates)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>atOrigin</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gab9c818bce70c71d50bfc7e372d2095ff</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::Data::CashFlow</name>
    <filename>classcfl_1_1Data_1_1CashFlow.html</filename>
    <member kind="variable">
      <type>double</type>
      <name>notional</name>
      <anchorfile>classcfl_1_1Data_1_1CashFlow.html</anchorfile>
      <anchor>a83e6efbb967ea198fdcf89fd182768d0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>double</type>
      <name>rate</name>
      <anchorfile>classcfl_1_1Data_1_1CashFlow.html</anchorfile>
      <anchor>a1db901b942d09692afaa53ba695e1f2d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>double</type>
      <name>period</name>
      <anchorfile>classcfl_1_1Data_1_1CashFlow.html</anchorfile>
      <anchor>a1908f61bd9961959a6fe84a839302f99</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>unsigned</type>
      <name>numberOfPayments</name>
      <anchorfile>classcfl_1_1Data_1_1CashFlow.html</anchorfile>
      <anchor>ac02486d6500d240bdb0f6f8b615fc19c</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::HullWhite::Data</name>
    <filename>classcfl_1_1HullWhite_1_1Data.html</filename>
    <member kind="variable">
      <type>Function</type>
      <name>discount</name>
      <anchorfile>classcfl_1_1HullWhite_1_1Data.html</anchorfile>
      <anchor>a117c8bf95766dac64e6bdbdcbd02cf35</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>Function</type>
      <name>shape</name>
      <anchorfile>classcfl_1_1HullWhite_1_1Data.html</anchorfile>
      <anchor>a1a83a406a6bf241a7351e84e27a4b3c8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>Function</type>
      <name>volatility</name>
      <anchorfile>classcfl_1_1HullWhite_1_1Data.html</anchorfile>
      <anchor>a23c185329b09f363897d5375bf650d03</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>double</type>
      <name>initialTime</name>
      <anchorfile>classcfl_1_1HullWhite_1_1Data.html</anchorfile>
      <anchor>a6979757110c0bbcf65070fb00662e80f</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::Error</name>
    <filename>classcfl_1_1Error.html</filename>
    <base>std::exception</base>
    <member kind="function">
      <type></type>
      <name>Error</name>
      <anchorfile>classcfl_1_1Error.html</anchorfile>
      <anchor>ac4e18e7c69d7496311499efcee71109d</anchor>
      <arglist>(const char *pWhere)</arglist>
    </member>
    <member kind="function">
      <type>const char *</type>
      <name>what</name>
      <anchorfile>classcfl_1_1Error.html</anchorfile>
      <anchor>a11b9cd25fb692618c78186f6c84bacfb</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::Function</name>
    <filename>classcfl_1_1Function.html</filename>
    <member kind="function">
      <type></type>
      <name>Function</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a30214a8eafd7442f2ff5cfc83131b4b3</anchor>
      <arglist>(double dV=0., double dL=-std::numeric_limits&lt; double &gt;::max(), double dR=std::numeric_limits&lt; double &gt;::max())</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Function</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>aaf7e32ded0390fbe8ccdeed8612a5330</anchor>
      <arglist>(IFunction *pNewP)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Function</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a9be1ca7540ee77144201ee40e779b5cb</anchor>
      <arglist>(const std::function&lt; double(double)&gt; &amp;rF, double dL=-std::numeric_limits&lt; double &gt;::max(), double dR=std::numeric_limits&lt; double &gt;::max())</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Function</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a67f948aaac73c26826f65a987f479a9c</anchor>
      <arglist>(const std::function&lt; double(double)&gt; &amp;rF, const std::function&lt; bool(double)&gt; &amp;rBelongs)</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>adf95def0d7df287a9ef01acd65552c17</anchor>
      <arglist>(double dV)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a8cc45c57aa5bcf30ec0bf6acce3c7670</anchor>
      <arglist>(double dX) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>belongs</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a85bc8e51a6eb4e33405e6a187b745183</anchor>
      <arglist>(double dX) const</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator+=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>aef4b99503792742de62192daa79c6df2</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator*=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a0cf890ed3d1f86169c569e46d9a5a577</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator-=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a24e5f65408691f1bbba52a3858fb57e1</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator/=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a4c28095c96d5d4e0be0c2f65825d67a7</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator+=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a47131c6d5d37011c27ac4a88bb123a72</anchor>
      <arglist>(double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator-=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a31be17e6c19669483ba035dc98eb61cf</anchor>
      <arglist>(double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator*=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>a943ec89197f3b36d516b9bbfa5ca2ba0</anchor>
      <arglist>(double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function &amp;</type>
      <name>operator/=</name>
      <anchorfile>classcfl_1_1Function.html</anchorfile>
      <anchor>ae7432ab8c298edd20dd6e91115b259f4</anchor>
      <arglist>(double dV)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::GaussRollback</name>
    <filename>classcfl_1_1GaussRollback.html</filename>
    <member kind="function">
      <type></type>
      <name>GaussRollback</name>
      <anchorfile>classcfl_1_1GaussRollback.html</anchorfile>
      <anchor>aee8f61ec6514ee2837038f04361704e2</anchor>
      <arglist>(IGaussRollback *pNewP=0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classcfl_1_1GaussRollback.html</anchorfile>
      <anchor>a7fb906726094b5b9b61a4de4a5320c41</anchor>
      <arglist>(unsigned iSize, double dH, double dVar)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>rollback</name>
      <anchorfile>classcfl_1_1GaussRollback.html</anchorfile>
      <anchor>ab6c7d0f33435160c80ea3c57650428d1</anchor>
      <arglist>(std::valarray&lt; double &gt; &amp;rValues) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>rollback</name>
      <anchorfile>classcfl_1_1GaussRollback.html</anchorfile>
      <anchor>a9294fcc52e425d805248d8a00f99c9c7</anchor>
      <arglist>(std::valarray&lt; double &gt; &amp;rValues, std::valarray&lt; double &gt; &amp;rDelta) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>rollback</name>
      <anchorfile>classcfl_1_1GaussRollback.html</anchorfile>
      <anchor>a25d07eb8274cea2c6311cfcd495a9771</anchor>
      <arglist>(std::valarray&lt; double &gt; &amp;rValues, std::valarray&lt; double &gt; &amp;rDelta, std::valarray&lt; double &gt; &amp;rGamma) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>vega</name>
      <anchorfile>classcfl_1_1GaussRollback.html</anchorfile>
      <anchor>ad74fbe4c9454a49589e7959fb9f3704b</anchor>
      <arglist>(std::valarray&lt; double &gt; &amp;rGammaToVega) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::IFunction</name>
    <filename>classcfl_1_1IFunction.html</filename>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IFunction</name>
      <anchorfile>classcfl_1_1IFunction.html</anchorfile>
      <anchor>a9c437e68e806a7f590985935ea1539ce</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual double</type>
      <name>operator()</name>
      <anchorfile>classcfl_1_1IFunction.html</anchorfile>
      <anchor>a2b92b7827fcd085c30481d66d2b823e8</anchor>
      <arglist>(double dX) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual bool</type>
      <name>belongs</name>
      <anchorfile>classcfl_1_1IFunction.html</anchorfile>
      <anchor>a1a91da27455f02e77aa91895261dbc53</anchor>
      <arglist>(double dX) const =0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::IGaussRollback</name>
    <filename>classcfl_1_1IGaussRollback.html</filename>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IGaussRollback</name>
      <anchorfile>classcfl_1_1IGaussRollback.html</anchorfile>
      <anchor>a9eb352964065abf762690b7cdc9a6c79</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual IGaussRollback *</type>
      <name>newObject</name>
      <anchorfile>classcfl_1_1IGaussRollback.html</anchorfile>
      <anchor>a597d4145be0476ecae69fba2a4f59b81</anchor>
      <arglist>(unsigned iSize, double dH, double dVar) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>rollback</name>
      <anchorfile>classcfl_1_1IGaussRollback.html</anchorfile>
      <anchor>a5007e6a9cbaeb8334130e9aa774235ff</anchor>
      <arglist>(std::valarray&lt; double &gt; &amp;rValues) const =0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::IInd</name>
    <filename>classcfl_1_1IInd.html</filename>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IInd</name>
      <anchorfile>classcfl_1_1IInd.html</anchorfile>
      <anchor>a78d07105ec121b0a363d4181712b0137</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>indicator</name>
      <anchorfile>classcfl_1_1IInd.html</anchorfile>
      <anchor>aa3a1ee62aeb1df6d899bf1f773b8e315</anchor>
      <arglist>(std::valarray&lt; double &gt; &amp;rValues, double dBarrier) const =0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::IInterestRateModel</name>
    <filename>classcfl_1_1IInterestRateModel.html</filename>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IInterestRateModel</name>
      <anchorfile>classcfl_1_1IInterestRateModel.html</anchorfile>
      <anchor>aff5804f1da22e983927f30c273063ef9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual IInterestRateModel *</type>
      <name>newModel</name>
      <anchorfile>classcfl_1_1IInterestRateModel.html</anchorfile>
      <anchor>a2c1b4fb8a1b7fa55a8747532bccb6cd9</anchor>
      <arglist>(const std::vector&lt; double &gt; &amp;rEventTimes) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual const IModel &amp;</type>
      <name>model</name>
      <anchorfile>classcfl_1_1IInterestRateModel.html</anchorfile>
      <anchor>af564783296aa2dea3b41308d8c26af61</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual Slice</type>
      <name>discount</name>
      <anchorfile>classcfl_1_1IInterestRateModel.html</anchorfile>
      <anchor>a8bc171204f9d02a66909dd7bba6ad10b</anchor>
      <arglist>(unsigned iEventTime, double dBondMaturity) const =0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::IInterp</name>
    <filename>classcfl_1_1IInterp.html</filename>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IInterp</name>
      <anchorfile>classcfl_1_1IInterp.html</anchorfile>
      <anchor>a9d10ce5642dda4db0397c2b0dfe8a7f7</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual Function</type>
      <name>interpolate</name>
      <anchorfile>classcfl_1_1IInterp.html</anchorfile>
      <anchor>a0ff5a765df9e6bd7145ced97c5894580</anchor>
      <arglist>(const std::vector&lt; double &gt; &amp;rArg, const std::vector&lt; double &gt; &amp;rVal) const =0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::IModel</name>
    <filename>classcfl_1_1IModel.html</filename>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IModel</name>
      <anchorfile>classcfl_1_1IModel.html</anchorfile>
      <anchor>af96ad96da01bd07f8713ddb23cd37ff3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual const std::vector&lt; double &gt; &amp;</type>
      <name>eventTimes</name>
      <anchorfile>classcfl_1_1IModel.html</anchorfile>
      <anchor>a2e137b2fc4c11e64738d308e58db9f9f</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual unsigned</type>
      <name>numberOfStates</name>
      <anchorfile>classcfl_1_1IModel.html</anchorfile>
      <anchor>ae651b2775665f6df8aa4e181d54e799f</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual unsigned</type>
      <name>numberOfNodes</name>
      <anchorfile>classcfl_1_1IModel.html</anchorfile>
      <anchor>a49e898c22eb18748c40dd24d95e00333</anchor>
      <arglist>(unsigned iEventTime, const std::vector&lt; unsigned &gt; &amp;rStates) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual Slice</type>
      <name>state</name>
      <anchorfile>classcfl_1_1IModel.html</anchorfile>
      <anchor>a38c32dc41955662e21bc3397350ebf18</anchor>
      <arglist>(unsigned iEventTime, unsigned iState) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual std::valarray&lt; double &gt;</type>
      <name>origin</name>
      <anchorfile>classcfl_1_1IModel.html</anchorfile>
      <anchor>a8bc2b920d13c26c41bea440cfeb1287c</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>addDependence</name>
      <anchorfile>classcfl_1_1IModel.html</anchorfile>
      <anchor>a5f46138866a1db1265d34fab5733dfc8</anchor>
      <arglist>(Slice &amp;rSlice, const std::vector&lt; unsigned &gt; &amp;rStates) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>rollback</name>
      <anchorfile>classcfl_1_1IModel.html</anchorfile>
      <anchor>a853f3c5ded82fb5364fa13ccf602ebc5</anchor>
      <arglist>(Slice &amp;rSlice, unsigned iEventTime) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>indicator</name>
      <anchorfile>classcfl_1_1IModel.html</anchorfile>
      <anchor>a61f8ae825d66d44fd5e5df0bc6744e04</anchor>
      <arglist>(Slice &amp;rSlice, double dBarrier) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual MultiFunction</type>
      <name>interpolate</name>
      <anchorfile>classcfl_1_1IModel.html</anchorfile>
      <anchor>a6a7161ee9227841bf05c605e62bab6ec</anchor>
      <arglist>(const Slice &amp;rSlice) const =0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::IMultiFunction</name>
    <filename>classcfl_1_1IMultiFunction.html</filename>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IMultiFunction</name>
      <anchorfile>classcfl_1_1IMultiFunction.html</anchorfile>
      <anchor>ad279e67c0cac702f54666f07d650001e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual double</type>
      <name>operator()</name>
      <anchorfile>classcfl_1_1IMultiFunction.html</anchorfile>
      <anchor>aa9294beb103344785106f1300d38e901</anchor>
      <arglist>(const std::valarray&lt; double &gt; &amp;rX) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual bool</type>
      <name>belongs</name>
      <anchorfile>classcfl_1_1IMultiFunction.html</anchorfile>
      <anchor>a72177a54755bf19b51efc9abda58f822</anchor>
      <arglist>(const std::valarray&lt; double &gt; &amp;rX) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual unsigned</type>
      <name>dim</name>
      <anchorfile>classcfl_1_1IMultiFunction.html</anchorfile>
      <anchor>a5ffbe04a403010670353bed3748ffff7</anchor>
      <arglist>() const =0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::Ind</name>
    <filename>classcfl_1_1Ind.html</filename>
    <member kind="function">
      <type></type>
      <name>Ind</name>
      <anchorfile>classcfl_1_1Ind.html</anchorfile>
      <anchor>a748d48468ebd0f020429ff05349ce9df</anchor>
      <arglist>(IInd *pNewInd=0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>indicator</name>
      <anchorfile>classcfl_1_1Ind.html</anchorfile>
      <anchor>a17cfee96f914343364c41133639fb93e</anchor>
      <arglist>(std::valarray&lt; double &gt; &amp;rValues, double dBarrier) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::InterestRateModel</name>
    <filename>classcfl_1_1InterestRateModel.html</filename>
    <member kind="function">
      <type></type>
      <name>InterestRateModel</name>
      <anchorfile>classcfl_1_1InterestRateModel.html</anchorfile>
      <anchor>ab0f6e79774a5ef6377ae6228ec563029</anchor>
      <arglist>(IInterestRateModel *pNewModel)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assignEventTimes</name>
      <anchorfile>classcfl_1_1InterestRateModel.html</anchorfile>
      <anchor>adf459d712b5b7f3e00b2288313e27618</anchor>
      <arglist>(const std::vector&lt; double &gt; &amp;rEventTimes)</arglist>
    </member>
    <member kind="function">
      <type>const IModel &amp;</type>
      <name>model</name>
      <anchorfile>classcfl_1_1InterestRateModel.html</anchorfile>
      <anchor>aac21e73796be628b89c8de1d49b31ef7</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; double &gt; &amp;</type>
      <name>eventTimes</name>
      <anchorfile>classcfl_1_1InterestRateModel.html</anchorfile>
      <anchor>a1d4809e115dd74ee858e48e9b59448ce</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>initialTime</name>
      <anchorfile>classcfl_1_1InterestRateModel.html</anchorfile>
      <anchor>a0bd3c80d0d86e08afc23ad50e1a02f3a</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>cash</name>
      <anchorfile>classcfl_1_1InterestRateModel.html</anchorfile>
      <anchor>a73ac8beb63771517c5218be121deb01b</anchor>
      <arglist>(unsigned iEventTime, double dAmount) const</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>discount</name>
      <anchorfile>classcfl_1_1InterestRateModel.html</anchorfile>
      <anchor>a7e6df737378f64759e82f8f74854e946</anchor>
      <arglist>(unsigned iEventTime, double dBondMaturity) const</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>state</name>
      <anchorfile>classcfl_1_1InterestRateModel.html</anchorfile>
      <anchor>a50d5d5f42b2cb07259fe4da1fac1f2e9</anchor>
      <arglist>(unsigned iEventTime, unsigned iState) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::Interp</name>
    <filename>classcfl_1_1Interp.html</filename>
    <member kind="function">
      <type></type>
      <name>Interp</name>
      <anchorfile>classcfl_1_1Interp.html</anchorfile>
      <anchor>a0f4bd3f32e580f9f7fbbe829330d839a</anchor>
      <arglist>(IInterp *pNewP=0)</arglist>
    </member>
    <member kind="function">
      <type>cfl::Function</type>
      <name>interpolate</name>
      <anchorfile>classcfl_1_1Interp.html</anchorfile>
      <anchor>a1b8a5ef5841332f96b365528c2d9b124</anchor>
      <arglist>(It1 itArgBegin, It1 itArgEnd, It2 itValBegin) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::Model</name>
    <filename>classcfl_1_1Model.html</filename>
    <member kind="function">
      <type></type>
      <name>Model</name>
      <anchorfile>classcfl_1_1Model.html</anchorfile>
      <anchor>af51f8e40805de2c241edadb7fdc0ee78</anchor>
      <arglist>(IModel *pNewP=0)</arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; double &gt; &amp;</type>
      <name>eventTimes</name>
      <anchorfile>classcfl_1_1Model.html</anchorfile>
      <anchor>af076785b3533d9394528542cfa277277</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>state</name>
      <anchorfile>classcfl_1_1Model.html</anchorfile>
      <anchor>af7ed0450d7777c89963203aad08399e4</anchor>
      <arglist>(unsigned iEventTime, unsigned iState) const</arglist>
    </member>
    <member kind="function">
      <type>const IModel &amp;</type>
      <name>model</name>
      <anchorfile>classcfl_1_1Model.html</anchorfile>
      <anchor>a63f8a85ad10afa5c87a9beef33ac79d5</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::MultiFunction</name>
    <filename>classcfl_1_1MultiFunction.html</filename>
    <member kind="function">
      <type></type>
      <name>MultiFunction</name>
      <anchorfile>classcfl_1_1MultiFunction.html</anchorfile>
      <anchor>a42d5d589ee32dcd18a19c1adfade030b</anchor>
      <arglist>(double dV=0., unsigned iDim=1)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MultiFunction</name>
      <anchorfile>classcfl_1_1MultiFunction.html</anchorfile>
      <anchor>af45d1aec06c75811eb16e350de9db924</anchor>
      <arglist>(IMultiFunction *pNewF)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MultiFunction</name>
      <anchorfile>classcfl_1_1MultiFunction.html</anchorfile>
      <anchor>ad0a32c89a430cfe7e12094910e630240</anchor>
      <arglist>(const std::function&lt; double(const std::valarray&lt; double &gt; &amp;)&gt; &amp;rF, unsigned iDim)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MultiFunction</name>
      <anchorfile>classcfl_1_1MultiFunction.html</anchorfile>
      <anchor>a2220c9c07545974aadc9cc07cee53744</anchor>
      <arglist>(const std::function&lt; double(const std::valarray&lt; double &gt; &amp;)&gt; &amp;rF, const std::function&lt; bool(const std::valarray&lt; double &gt; &amp;)&gt; &amp;rBelongs, unsigned iDim)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction &amp;</type>
      <name>operator=</name>
      <anchorfile>classcfl_1_1MultiFunction.html</anchorfile>
      <anchor>a0c3e42a0bb20816243e35cc5de34ce4b</anchor>
      <arglist>(double dV)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator()</name>
      <anchorfile>classcfl_1_1MultiFunction.html</anchorfile>
      <anchor>a2d46129063d7fe61a7ece8dcf033a2c0</anchor>
      <arglist>(const std::valarray&lt; double &gt; &amp;rX) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>belongs</name>
      <anchorfile>classcfl_1_1MultiFunction.html</anchorfile>
      <anchor>a6fd434bbde5ce79146d7edd427a1087c</anchor>
      <arglist>(const std::valarray&lt; double &gt; &amp;rX) const</arglist>
    </member>
    <member kind="function">
      <type>unsigned</type>
      <name>dim</name>
      <anchorfile>classcfl_1_1MultiFunction.html</anchorfile>
      <anchor>aa9aa5321bdebc90b12f248be40368eaa</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction &amp;</type>
      <name>operator+=</name>
      <anchorfile>classcfl_1_1MultiFunction.html</anchorfile>
      <anchor>ae7a5470b32e893d788245461d93faa3c</anchor>
      <arglist>(const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction &amp;</type>
      <name>operator*=</name>
      <anchorfile>classcfl_1_1MultiFunction.html</anchorfile>
      <anchor>a457d8791686cd30e0adec0e75207c14d</anchor>
      <arglist>(const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction &amp;</type>
      <name>operator-=</name>
      <anchorfile>classcfl_1_1MultiFunction.html</anchorfile>
      <anchor>a34913341fdace293e82524b5faef4d56</anchor>
      <arglist>(const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction &amp;</type>
      <name>operator/=</name>
      <anchorfile>classcfl_1_1MultiFunction.html</anchorfile>
      <anchor>afe383161ff200275dcddb7a425b5e651</anchor>
      <arglist>(const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction &amp;</type>
      <name>operator+=</name>
      <anchorfile>classcfl_1_1MultiFunction.html</anchorfile>
      <anchor>a60197c1ff2c81ef7cc0666be3627ebad</anchor>
      <arglist>(double dV)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction &amp;</type>
      <name>operator-=</name>
      <anchorfile>classcfl_1_1MultiFunction.html</anchorfile>
      <anchor>a671c74fe792212cabc805a24b54e6448</anchor>
      <arglist>(double dV)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction &amp;</type>
      <name>operator*=</name>
      <anchorfile>classcfl_1_1MultiFunction.html</anchorfile>
      <anchor>a3c20def5934169fc9d3823a7ba913dac</anchor>
      <arglist>(double dV)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction &amp;</type>
      <name>operator/=</name>
      <anchorfile>classcfl_1_1MultiFunction.html</anchorfile>
      <anchor>afafd3e50b90bf6014330abb1849ce153</anchor>
      <arglist>(double dV)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::Slice</name>
    <filename>classcfl_1_1Slice.html</filename>
    <member kind="function">
      <type></type>
      <name>Slice</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a650d01eaaac00367a6c977e41197be65</anchor>
      <arglist>(const IModel *pModel=0, unsigned iEventTime=0, double dValue=0)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Slice</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a69f0a5b28ba365efe2ecc1e9338f18e3</anchor>
      <arglist>(const IModel &amp;rModel, unsigned iEventTime, const std::vector&lt; unsigned &gt; &amp;rDependence, const std::valarray&lt; double &gt; &amp;rValues)</arglist>
    </member>
    <member kind="function">
      <type>Slice &amp;</type>
      <name>operator=</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a172a8a8d47a543b0b0bb07a6af89c42b</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice &amp;</type>
      <name>operator=</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a95a85f86a1555699d4b89127dde42047</anchor>
      <arglist>(double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice &amp;</type>
      <name>operator+=</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a9ccdc15b389e3f296b0925ad336a82ac</anchor>
      <arglist>(double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice &amp;</type>
      <name>operator-=</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>af66f61bcf11615800eaec16a8043713d</anchor>
      <arglist>(double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice &amp;</type>
      <name>operator*=</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a8c7badc48aec2e0fdf4ac1f4ad23de40</anchor>
      <arglist>(double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice &amp;</type>
      <name>operator/=</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a151161b2e5693cff15cb5e25e415fb2f</anchor>
      <arglist>(double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice &amp;</type>
      <name>operator+=</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a2ea2517319553e076130074b51df7954</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice &amp;</type>
      <name>operator-=</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a201363078ac58c1fcfd6272ca8c4ec0d</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice &amp;</type>
      <name>operator*=</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>aa84f5afb4cc5fb96edce0cb18093e92e</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice &amp;</type>
      <name>operator/=</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>ab47b95d2b0f6352ededda0830250f746</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>apply</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a3ab804441f8631c5382c102eb2afffbb</anchor>
      <arglist>(double(*f)(double)) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>rollback</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>ad6650863a06a79c3d69685d757d40bb8</anchor>
      <arglist>(unsigned iEventTime)</arglist>
    </member>
    <member kind="function">
      <type>const IModel &amp;</type>
      <name>model</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a82f727d28a328ee7b5a49a171c4f615e</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>unsigned</type>
      <name>timeIndex</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a439a63e80fa9989ae3f7174d57388ee4</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; unsigned &gt; &amp;</type>
      <name>dependence</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>aa47681649c2b259cc7fd35f549e84a5b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const std::valarray&lt; double &gt; &amp;</type>
      <name>values</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a1bcf2dcccd6714a4d46899dd7c8b0ac1</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::valarray&lt; double &gt; &amp;</type>
      <name>values</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a0473b074144588fd9662823b45204f6d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a102c9e6f39c465e0b7178bdaaac7c267</anchor>
      <arglist>(const IModel &amp;rModel, unsigned iEventTime, const std::vector&lt; unsigned &gt; &amp;rDependence, const std::valarray&lt; double &gt; &amp;rValues)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a52b745849c639c1d496be9e29b44278c</anchor>
      <arglist>(unsigned iEventTime, const std::vector&lt; unsigned &gt; &amp;rDependence, const std::valarray&lt; double &gt; &amp;rValues)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a30bda68b170c3e87784df038d4fe4147</anchor>
      <arglist>(const std::vector&lt; unsigned &gt; &amp;rDependence, const std::valarray&lt; double &gt; &amp;rValues)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classcfl_1_1Slice.html</anchorfile>
      <anchor>a07d8f026516b0899f5ea5cad757b1c86</anchor>
      <arglist>(const IModel &amp;rModel)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>cfl::Data::Swap</name>
    <filename>classcfl_1_1Data_1_1Swap.html</filename>
    <base>cfl::Data::CashFlow</base>
    <member kind="function">
      <type></type>
      <name>Swap</name>
      <anchorfile>classcfl_1_1Data_1_1Swap.html</anchorfile>
      <anchor>a0f3a707e0a0789c742a74adc380bd617</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Swap</name>
      <anchorfile>classcfl_1_1Data_1_1Swap.html</anchorfile>
      <anchor>a625a0fb180d14af005daa1ffebf45258</anchor>
      <arglist>(const CashFlow &amp;rCashFlow, bool bPayFloat=true)</arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>payFloat</name>
      <anchorfile>classcfl_1_1Data_1_1Swap.html</anchorfile>
      <anchor>a288b309704865d5cf5b1679b341c4236</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>cfl::Data</name>
    <filename>namespacecfl_1_1Data.html</filename>
    <class kind="class">cfl::Data::CashFlow</class>
    <class kind="class">cfl::Data::Swap</class>
    <member kind="function">
      <type>Function</type>
      <name>discount</name>
      <anchorfile>namespacecfl_1_1Data.html</anchorfile>
      <anchor>a4575eaa8279c938412253e3ff6269413</anchor>
      <arglist>(double dYield, double dInitialTime)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>discount</name>
      <anchorfile>namespacecfl_1_1Data.html</anchorfile>
      <anchor>abbb1e8d9f7d299d60c846e5ae477a9a5</anchor>
      <arglist>(const Function &amp;rYield, double dInitialTime)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>volatility</name>
      <anchorfile>namespacecfl_1_1Data.html</anchorfile>
      <anchor>aa9561ed3f83762f4260324be1b70f45c</anchor>
      <arglist>(double dSigma, double dLambda, double dInitialTime)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>forward</name>
      <anchorfile>namespacecfl_1_1Data.html</anchorfile>
      <anchor>a2d070b6a8d3e7c19886dee13def2978b</anchor>
      <arglist>(double dSpot, double dCostOfCarry, double dInitialTime)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>forward</name>
      <anchorfile>namespacecfl_1_1Data.html</anchorfile>
      <anchor>abe01a2be0546fad89dc429c1c99139e8</anchor>
      <arglist>(double dSpot, const Function &amp;rCostOfCarry, double dInitialTime)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>forward</name>
      <anchorfile>namespacecfl_1_1Data.html</anchorfile>
      <anchor>ae8bb46ec753435fee82de68490d210b6</anchor>
      <arglist>(double dSpot, double dDividendYield, const Function &amp;rDiscount, double dInitialTime)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>cfl::HullWhite</name>
    <filename>namespacecfl_1_1HullWhite.html</filename>
    <class kind="class">cfl::HullWhite::Data</class>
    <member kind="function">
      <type>Data</type>
      <name>makeData</name>
      <anchorfile>namespacecfl_1_1HullWhite.html</anchorfile>
      <anchor>aa94b4e87ccfbeb48c2892097043bc776</anchor>
      <arglist>(const Function &amp;rDiscount, const Function &amp;rVolatility, const Function &amp;rShape, double dInitialTime)</arglist>
    </member>
    <member kind="function">
      <type>Data</type>
      <name>makeData</name>
      <anchorfile>namespacecfl_1_1HullWhite.html</anchorfile>
      <anchor>a58106344a5c0d56eac7ec2862798896a</anchor>
      <arglist>(const Function &amp;rDiscount, double dKappa, double dLambda, double dInitialTime)</arglist>
    </member>
    <member kind="function">
      <type>InterestRateModel</type>
      <name>model</name>
      <anchorfile>namespacecfl_1_1HullWhite.html</anchorfile>
      <anchor>a307446e9eb7f760c5fd5f2a4b456bda0</anchor>
      <arglist>(const Data &amp;rData, double dInterval, double dQuality)</arglist>
    </member>
    <member kind="function">
      <type>InterestRateModel</type>
      <name>model</name>
      <anchorfile>namespacecfl_1_1HullWhite.html</anchorfile>
      <anchor>a5df87f5e3547bb45638a892f4047ddec</anchor>
      <arglist>(const Data &amp;rData, double dInterval, const TBrownian &amp;rBrownian)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>cfl::NError</name>
    <filename>namespacecfl_1_1NError.html</filename>
    <member kind="function">
      <type>Error</type>
      <name>range</name>
      <anchorfile>namespacecfl_1_1NError.html</anchorfile>
      <anchor>a894a502c1601ee82feaadffd50b93002</anchor>
      <arglist>(const char *pWhere)</arglist>
    </member>
    <member kind="function">
      <type>Error</type>
      <name>sort</name>
      <anchorfile>namespacecfl_1_1NError.html</anchorfile>
      <anchor>a1eded1c862e839e80fb15a8ffbffcd67</anchor>
      <arglist>(const char *pWhere)</arglist>
    </member>
    <member kind="function">
      <type>Error</type>
      <name>size</name>
      <anchorfile>namespacecfl_1_1NError.html</anchorfile>
      <anchor>ac6ec8baaccb77da7ec8d57c2290a3a14</anchor>
      <arglist>(const char *pWhere)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>cfl::NGaussRollback</name>
    <filename>namespacecfl_1_1NGaussRollback.html</filename>
    <member kind="function">
      <type>cfl::GaussRollback</type>
      <name>expl</name>
      <anchorfile>namespacecfl_1_1NGaussRollback.html</anchorfile>
      <anchor>ad9e18bcdee87d682502d2689b666d28e</anchor>
      <arglist>(double dP=1./3.)</arglist>
    </member>
    <member kind="function">
      <type>cfl::GaussRollback</type>
      <name>impl</name>
      <anchorfile>namespacecfl_1_1NGaussRollback.html</anchorfile>
      <anchor>ae9a6862c4cdc1805a9a526aa9c5ca69b</anchor>
      <arglist>(double dP=1.)</arglist>
    </member>
    <member kind="function">
      <type>cfl::GaussRollback</type>
      <name>crankNicolson</name>
      <anchorfile>namespacecfl_1_1NGaussRollback.html</anchorfile>
      <anchor>ae1995420ebcc55f71d064bca177e46b1</anchor>
      <arglist>(double dR=1.)</arglist>
    </member>
    <member kind="function">
      <type>cfl::GaussRollback</type>
      <name>fft2</name>
      <anchorfile>namespacecfl_1_1NGaussRollback.html</anchorfile>
      <anchor>a3b15b9e1f927b14a251fdabd81350c03</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cfl::GaussRollback</type>
      <name>fft</name>
      <anchorfile>namespacecfl_1_1NGaussRollback.html</anchorfile>
      <anchor>a21e0d890666f7b1d3d0a430a8ec65d95</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cfl::GaussRollback</type>
      <name>chain</name>
      <anchorfile>namespacecfl_1_1NGaussRollback.html</anchorfile>
      <anchor>a5d10f98159a03792e025e977311ff6c7</anchor>
      <arglist>(unsigned iExplSteps, const cfl::GaussRollback &amp;rFast, unsigned iImplSteps, double dExplP=1./3., double dImplP=1.)</arglist>
    </member>
    <member kind="function">
      <type>cfl::GaussRollback</type>
      <name>chain</name>
      <anchorfile>namespacecfl_1_1NGaussRollback.html</anchorfile>
      <anchor>a684370ae5005a3a264cbb163a82f20bd</anchor>
      <arglist>(const char *sFastScheme=&quot;fft2&quot;)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>cfl::NInd</name>
    <filename>namespacecfl_1_1NInd.html</filename>
    <member kind="function">
      <type>cfl::Ind</type>
      <name>naive</name>
      <anchorfile>namespacecfl_1_1NInd.html</anchorfile>
      <anchor>acee018ab22dc192a43722c66d976e370</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cfl::Ind</type>
      <name>linear</name>
      <anchorfile>namespacecfl_1_1NInd.html</anchorfile>
      <anchor>ac051330b9ab286b624e8474cfd039b07</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cfl::Ind</type>
      <name>quadratic</name>
      <anchorfile>namespacecfl_1_1NInd.html</anchorfile>
      <anchor>a3d4fc17aadd424d3dd71d65c71975ac5</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>cfl::NInterp</name>
    <filename>namespacecfl_1_1NInterp.html</filename>
    <member kind="function">
      <type>cfl::Interp</type>
      <name>linear</name>
      <anchorfile>namespacecfl_1_1NInterp.html</anchorfile>
      <anchor>a67d5187b35fd70ff9dbf47d6e134f13a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cfl::Interp</type>
      <name>cspline</name>
      <anchorfile>namespacecfl_1_1NInterp.html</anchorfile>
      <anchor>ab54103b1f47c1f0a051d21b6d657639e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cfl::Interp</type>
      <name>steffen</name>
      <anchorfile>namespacecfl_1_1NInterp.html</anchorfile>
      <anchor>ab908196af34b402103397d8b5894f501</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cfl::Interp</type>
      <name>akima</name>
      <anchorfile>namespacecfl_1_1NInterp.html</anchorfile>
      <anchor>ab5fe5612a3ac6d3e18991a9d70384056</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>cfl::Interp</type>
      <name>polynomial</name>
      <anchorfile>namespacecfl_1_1NInterp.html</anchorfile>
      <anchor>a9546b3626f5dfb8ff616bff8228e8354</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>cflBrownian</name>
    <title>Basic model with Brownian motion.</title>
    <filename>group__cflBrownian.html</filename>
    <member kind="typedef">
      <type>std::function&lt; Model(const std::vector&lt; double &gt; &amp;rVar, const std::vector&lt; double &gt; &amp;rEventTimes, double dInterval)&gt;</type>
      <name>TBrownian</name>
      <anchorfile>group__cflBrownian.html</anchorfile>
      <anchor>ga2edf757df6a07bf697cafa4d7420bd61</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>TBrownian</type>
      <name>brownian</name>
      <anchorfile>group__cflBrownian.html</anchorfile>
      <anchor>gaf620d03b7ad7046fee89b5ee9069d063</anchor>
      <arglist>(double dQuality, const GaussRollback &amp;rRollback=cfl::NGaussRollback::chain(), const Ind &amp;rInd=cfl::NInd::linear(), const Interp &amp;rInterp=cfl::NInterp::cspline())</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>cflCommonElements</name>
    <title>Common elements of financial models.</title>
    <filename>group__cflCommonElements.html</filename>
    <subgroup>cflBrownian</subgroup>
    <subgroup>cflData</subgroup>
    <subgroup>cflSimilar</subgroup>
    <subgroup>cflBasicElements</subgroup>
  </compound>
  <compound kind="group">
    <name>cflData</name>
    <title>Data structures.</title>
    <filename>group__cflData.html</filename>
    <namespace>cfl::Data</namespace>
  </compound>
  <compound kind="group">
    <name>cflMisc</name>
    <title>Auxiliary items.</title>
    <filename>group__cflMisc.html</filename>
    <subgroup>cflError</subgroup>
    <subgroup>cflMacros</subgroup>
  </compound>
  <compound kind="group">
    <name>cflError</name>
    <title>Exceptions.</title>
    <filename>group__cflError.html</filename>
    <namespace>cfl::NError</namespace>
    <class kind="class">cfl::Error</class>
  </compound>
  <compound kind="group">
    <name>cflFunctionObjects</name>
    <title>Function objects.</title>
    <filename>group__cflFunctionObjects.html</filename>
    <subgroup>cflFunction</subgroup>
    <subgroup>cflMultiFunction</subgroup>
  </compound>
  <compound kind="group">
    <name>cflFunction</name>
    <title>One-dimensional function object.</title>
    <filename>group__cflFunction.html</filename>
    <class kind="class">cfl::IFunction</class>
    <class kind="class">cfl::Function</class>
    <member kind="function">
      <type>Function</type>
      <name>apply</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaefc6f748aa55ba9af5888fc5939165e3</anchor>
      <arglist>(const Function &amp;rF, const std::function&lt; double(double)&gt; &amp;rOp)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>apply</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga1aad160b1231eab45c51bcbfd4ebb6ed</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG, const std::function&lt; double(double, double)&gt; &amp;rOp)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga9002e8a5719a0e0f8641c07c2776c65f</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator+</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga791881014381dc9299817a8ee54c01a4</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator+</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaebb9ffd9ebdf865392443b29a8ca3e81</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator+</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaa2901a847a20fd95fce20b72d94608ca</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga780c9857fc017d7e7e0a189f37780853</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga89ab2b0065cd02be196a8eb8e2100bab</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator-</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga4b95eadaa3cd0c7555aa12ef099cb083</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator*</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga23508570c1c867b26314fef7b138ec8f</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator*</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga7724362a5921d2ca77728d86c99a76f7</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator*</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaa56f481d9efec745cc2441743735f56e</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator/</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga5a9609f238dcd27d489c120d300e8d2f</anchor>
      <arglist>(const Function &amp;rF, const Function &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator/</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gaafb41bdcea13efa36de86fab86a8c8d7</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>operator/</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gadd70bb3e3d448678e90960b415fb253c</anchor>
      <arglist>(double dV, const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>pow</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga0ad815989b496eb88418f0cfacb86a8b</anchor>
      <arglist>(const Function &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>abs</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga57c16d6a064f32801f2e623e316d2c08</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>exp</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga52c70d0f89df857c746bc8cd465b4492</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>log</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>ga7a3f02432f55b86da5cda89b0ba989ff</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>sqrt</name>
      <anchorfile>group__cflFunction.html</anchorfile>
      <anchor>gad5d6807fd56f4f4d275aef884a1a4db6</anchor>
      <arglist>(const Function &amp;rF)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>cflGaussRollback</name>
    <title>Gaussian conditional expectation.</title>
    <filename>group__cflGaussRollback.html</filename>
    <namespace>cfl::NGaussRollback</namespace>
    <class kind="class">cfl::IGaussRollback</class>
    <class kind="class">cfl::GaussRollback</class>
  </compound>
  <compound kind="group">
    <name>cflHullWhite</name>
    <title>Hull and White model for interest rates.</title>
    <filename>group__cflHullWhite.html</filename>
    <namespace>cfl::HullWhite</namespace>
  </compound>
  <compound kind="group">
    <name>cflInd</name>
    <title>Indicators of one-dimensional functions.</title>
    <filename>group__cflInd.html</filename>
    <namespace>cfl::NInd</namespace>
    <class kind="class">cfl::IInd</class>
    <class kind="class">cfl::Ind</class>
  </compound>
  <compound kind="group">
    <name>cflNumeric</name>
    <title>Numerical methods.</title>
    <filename>group__cflNumeric.html</filename>
    <subgroup>cflGaussRollback</subgroup>
    <subgroup>cflInd</subgroup>
    <subgroup>cflInterp</subgroup>
  </compound>
  <compound kind="group">
    <name>cflInterestRateModel</name>
    <title>Interest rate models.</title>
    <filename>group__cflInterestRateModel.html</filename>
    <subgroup>cflHullWhite</subgroup>
    <class kind="class">cfl::IInterestRateModel</class>
    <class kind="class">cfl::InterestRateModel</class>
  </compound>
  <compound kind="group">
    <name>cflInterp</name>
    <title>Interpolation of one-dimensional functions.</title>
    <filename>group__cflInterp.html</filename>
    <namespace>cfl::NInterp</namespace>
    <class kind="class">cfl::IInterp</class>
    <class kind="class">cfl::Interp</class>
  </compound>
  <compound kind="group">
    <name>cflMacros</name>
    <title>Macros and constants.</title>
    <filename>group__cflMacros.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>PRECONDITION</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>gad98dcd871dcffebd5a39802226a429b1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>ASSERT</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>gaf343b20373ba49a92fce523e948f2ab3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>POSTCONDITION</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>ga41c215e9b1a35b82ddacbdbd2dfd707d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const double</type>
      <name>EPS</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>gae4eb6817537ee44fb52f581538da5ee7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const unsigned</type>
      <name>IMAX</name>
      <anchorfile>group__cflMacros.html</anchorfile>
      <anchor>ga9af89fe2818b01bb5fc41f307a9fcee1</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>cflMultiFunction</name>
    <title>Multi-dimensional function object.</title>
    <filename>group__cflMultiFunction.html</filename>
    <class kind="class">cfl::IMultiFunction</class>
    <class kind="class">cfl::MultiFunction</class>
    <member kind="function">
      <type>MultiFunction</type>
      <name>apply</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga5247e31632f9710cbbf9accfe834383e</anchor>
      <arglist>(const MultiFunction &amp;rF, const std::function&lt; double(double)&gt; &amp;rOp)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>apply</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>gaf3137b36af4def0bef224625158b1ee2</anchor>
      <arglist>(const MultiFunction &amp;rF, const MultiFunction &amp;rG, const std::function&lt; double(double, double)&gt; &amp;rOp)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator-</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga40f53303aea62d73fc853819ed6e5837</anchor>
      <arglist>(const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator+</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga37338e31a6a4f8f2905551ab72fb9c8b</anchor>
      <arglist>(const MultiFunction &amp;rF, const MultiFunction &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator+</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>gacfd17352434d3815e3db45028ecf1a18</anchor>
      <arglist>(const MultiFunction &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator+</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga17b936b13bc246df5bfd4bc11fba6791</anchor>
      <arglist>(double dV, const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator-</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga34d84ccc5639453caed3df61e7851b90</anchor>
      <arglist>(const MultiFunction &amp;rF, const MultiFunction &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator-</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>gac2de7180a86332c72defc54d89ccf0ea</anchor>
      <arglist>(const MultiFunction &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator-</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>gadbb2599723603e89c6479675f3b27201</anchor>
      <arglist>(double dV, const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator*</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>gaef6a511dd49168f6ba0552d932160954</anchor>
      <arglist>(const MultiFunction &amp;rF, const MultiFunction &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator*</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>gaf96b53e2581d663f660be10cceb4d939</anchor>
      <arglist>(const MultiFunction &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator*</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga715f406b62c8850e1afccf93d0f31a03</anchor>
      <arglist>(double dV, const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator/</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga2659b4388ba89c590e871545cc1f9c24</anchor>
      <arglist>(const MultiFunction &amp;rF, const MultiFunction &amp;rG)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator/</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>gaa277497fea39fc9bf6e5253761a0fd9c</anchor>
      <arglist>(const MultiFunction &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>operator/</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga12a036f1c869d65a4900f5b2bb2420da</anchor>
      <arglist>(double dV, const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>pow</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga92da3fb0054e172cdde524a7d95f0781</anchor>
      <arglist>(const MultiFunction &amp;rF, double dV)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>abs</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga22c909396db6796296bc88664fe3ca05</anchor>
      <arglist>(const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>exp</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga4533cffaa9d943f0d499cd326f9cad7a</anchor>
      <arglist>(const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>log</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga7be7274a542c736132f5b2dc6973df04</anchor>
      <arglist>(const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>sqrt</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga3d3bb4ca7588f011089ac5930ff5ef9e</anchor>
      <arglist>(const MultiFunction &amp;rF)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>toMultiFunction</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga14973cccaa304063c3b3203362e6f965</anchor>
      <arglist>(const Function &amp;rF, unsigned iArg, unsigned iDim)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>toMultiFunction</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga6efeec5029b76cd45ad07b114a445d79</anchor>
      <arglist>(const MultiFunction &amp;rF, const std::vector&lt; unsigned &gt; &amp;rArg, const std::valarray&lt; double &gt; &amp;rOtherArg)</arglist>
    </member>
    <member kind="function">
      <type>Function</type>
      <name>toFunction</name>
      <anchorfile>group__cflMultiFunction.html</anchorfile>
      <anchor>ga21229af02dbb2bbfbbf365d0de718073</anchor>
      <arglist>(const MultiFunction &amp;rF, unsigned iArg=0, const std::valarray&lt; double &gt; &amp;rOtherArg=std::valarray&lt; double &gt;())</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>cflSimilar</name>
    <title>Similar financial models.</title>
    <filename>group__cflSimilar.html</filename>
    <member kind="typedef">
      <type>std::function&lt; void(Slice &amp;rSlice, unsigned iEventTime)&gt;</type>
      <name>TRollback</name>
      <anchorfile>group__cflSimilar.html</anchorfile>
      <anchor>gaa2dae5e9fc241dc53a9c479f5174b492</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>Model</type>
      <name>similar</name>
      <anchorfile>group__cflSimilar.html</anchorfile>
      <anchor>ga567f1b883accd62da57a2db6068d1e25</anchor>
      <arglist>(const TRollback &amp;rTargetRollback, const Model &amp;rBase)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>cflBasicElements</name>
    <title>Basic classes: Slice and IModel.</title>
    <filename>group__cflBasicElements.html</filename>
    <class kind="class">cfl::IModel</class>
    <class kind="class">cfl::Model</class>
    <class kind="class">cfl::Slice</class>
    <member kind="function">
      <type>Slice</type>
      <name>operator-</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga80f495b02da87961b2c803c54e405811</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator+</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga374fd57ec7c3e05ddd47edee8b0e7157</anchor>
      <arglist>(const Slice &amp;rSlice1, const Slice &amp;rSlice2)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator-</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gac0c91efe72add419674ea493f91cb017</anchor>
      <arglist>(const Slice &amp;rSlice1, const Slice &amp;rSlice2)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator*</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga0da7ecbc5dc94b694402a27af67dc9f6</anchor>
      <arglist>(const Slice &amp;rSlice1, const Slice &amp;rSlice2)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator/</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gae399586e7aa20aaebae61bd6c774692e</anchor>
      <arglist>(const Slice &amp;rSlice1, const Slice &amp;rSlice2)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator+</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga01add91d64e3235c3b4b34a0a6b5b0f3</anchor>
      <arglist>(const Slice &amp;rSlice, double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator-</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gaba5e3d5fbd8f14f61c017ab462b2071b</anchor>
      <arglist>(const Slice &amp;rSlice, double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator*</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga24c5cbf84abb6e37e0576a084dcbfbca</anchor>
      <arglist>(const Slice &amp;rSlice, double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator/</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga92ba954ea1102aa0c0952b023ba70c81</anchor>
      <arglist>(const Slice &amp;rSlice, double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator+</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gae5bd3d942f6971cd07bdde472f76b39a</anchor>
      <arglist>(double dValue, const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator-</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga5d2ccb038b1427bef1d7824649cdb525</anchor>
      <arglist>(double dValue, const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator*</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga7fab9bed11d2ca0f41df8364ca69c1eb</anchor>
      <arglist>(double dValue, const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>operator/</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga620911ee6d11c3c11c4667c36e157312</anchor>
      <arglist>(double dValue, const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>max</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gaeda8222b946329347f90331853ea69ed</anchor>
      <arglist>(const Slice &amp;rSlice, double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>min</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gad04503952a9d5381cb88417a8c023897</anchor>
      <arglist>(const Slice &amp;rSlice, double dValue)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>max</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga1c74f2959de24e1d2bf7a6a293dcc3fb</anchor>
      <arglist>(const Slice &amp;rSlice1, const Slice &amp;rSlice2)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>min</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga1876c62ab5036a5438ff9d0eb2251779</anchor>
      <arglist>(const Slice &amp;rSlice1, const Slice &amp;rSlice2)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>max</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga82e23642163851ad945a6e3ac666e1db</anchor>
      <arglist>(double dValue, const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>min</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga1f819b430a1b7bca0b596ec90e327422</anchor>
      <arglist>(double dValue, const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>pow</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga0cdcad478e76343a9b4ad5894302c389</anchor>
      <arglist>(const Slice &amp;rSlice, double dPower)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>abs</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga3f134283a0d917b9316eb9fd6f3723a1</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>exp</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga9ec23cfc4580415b7313224a982c3ed7</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>log</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gaeffb5d137589b9703437f7a51fd526c4</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>sqrt</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga45a120b4337e064ad058c7af07a56ddc</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>indicator</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga9e139c90bce3cf4f84449e01c2711279</anchor>
      <arglist>(const Slice &amp;rSlice, double dBarrier)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>indicator</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga1070cddc9a59774bf2ebc8ba05bb4036</anchor>
      <arglist>(double dBarrier, const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>indicator</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga5c8dc0ed13dcf2781e738df39cef9021</anchor>
      <arglist>(const Slice &amp;rSlice, const Slice &amp;rBarrier)</arglist>
    </member>
    <member kind="function">
      <type>Slice</type>
      <name>rollback</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga5236ca42033ba7cc1ea8ee451c65ff66</anchor>
      <arglist>(const Slice &amp;rSlice, unsigned iEventTime)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>interpolate</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga292415bb3151ad35ca7847c35138c254</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>interpolate</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gae646e527786dfb3623a723e12e6fe884</anchor>
      <arglist>(const Slice &amp;rSlice, const std::vector&lt; unsigned &gt; &amp;rState)</arglist>
    </member>
    <member kind="function">
      <type>MultiFunction</type>
      <name>interpolate</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>ga603b7c7732e23b656b4ccc17451001ce</anchor>
      <arglist>(const Slice &amp;rSlice, unsigned iStates)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>atOrigin</name>
      <anchorfile>group__cflBasicElements.html</anchorfile>
      <anchor>gab9c818bce70c71d50bfc7e372d2095ff</anchor>
      <arglist>(const Slice &amp;rSlice)</arglist>
    </member>
  </compound>
  <compound kind="page">
    <name>index</name>
    <title>Library for the course &quot;Financial Computing with C++&quot;</title>
    <filename>index</filename>
  </compound>
</tagfile>
