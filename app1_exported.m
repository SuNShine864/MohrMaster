classdef app1_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure               matlab.ui.Figure
        ResetButton            matlab.ui.control.Button
        DisplayButton          matlab.ui.control.Button
        Eigen_directionsPanel  matlab.ui.container.Panel
        EditField17            matlab.ui.control.NumericEditField
        EditField17Label       matlab.ui.control.Label
        EditField18            matlab.ui.control.NumericEditField
        EditField18Label       matlab.ui.control.Label
        EditField11            matlab.ui.control.NumericEditField
        EditField11Label       matlab.ui.control.Label
        EditField12            matlab.ui.control.NumericEditField
        EditField12Label       matlab.ui.control.Label
        EditField15            matlab.ui.control.NumericEditField
        EditField15Label       matlab.ui.control.Label
        EditField14            matlab.ui.control.NumericEditField
        EditField14Label       matlab.ui.control.Label
        EditField16            matlab.ui.control.NumericEditField
        EditField16Label       matlab.ui.control.Label
        EditField13            matlab.ui.control.NumericEditField
        EditField13Label       matlab.ui.control.Label
        EditField10            matlab.ui.control.NumericEditField
        EditField10Label       matlab.ui.control.Label
        Eigen_ValuesPanel      matlab.ui.container.Panel
        lambda3EditField       matlab.ui.control.NumericEditField
        lambda3EditFieldLabel  matlab.ui.control.Label
        lambda2EditField       matlab.ui.control.NumericEditField
        lambda2EditFieldLabel  matlab.ui.control.Label
        lambda1EditField       matlab.ui.control.NumericEditField
        lambda1EditFieldLabel  matlab.ui.control.Label
        CalculateButton        matlab.ui.control.Button
        StressMatrixPanel      matlab.ui.container.Panel
        EditField9             matlab.ui.control.NumericEditField
        EditField9Label        matlab.ui.control.Label
        EditField8             matlab.ui.control.NumericEditField
        EditField8Label        matlab.ui.control.Label
        EditField7             matlab.ui.control.NumericEditField
        EditField7Label        matlab.ui.control.Label
        EditField6             matlab.ui.control.NumericEditField
        EditField6Label        matlab.ui.control.Label
        EditField5             matlab.ui.control.NumericEditField
        EditField5Label        matlab.ui.control.Label
        EditField4             matlab.ui.control.NumericEditField
        EditField4Label        matlab.ui.control.Label
        EditField3             matlab.ui.control.NumericEditField
        EditField3Label        matlab.ui.control.Label
        EditField2             matlab.ui.control.NumericEditField
        EditField2Label        matlab.ui.control.Label
        EditField              matlab.ui.control.NumericEditField
        EditFieldLabel         matlab.ui.control.Label
    end

    
    properties (Access = private)
        Property % Description
    end
    
    properties (Access = public)
        Property2 % Description
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: CalculateButton
        function CalculateButtonPushed(app, event)
            Sigma_xx=app.EditField.Value;
            Sigma_xy=app.EditField2.Value;
            Sigma_xz=app.EditField3.Value;
            Sigma_yx=app.EditField4.Value; 
            Sigma_yy=app.EditField5.Value;
            Sigma_yz=app.EditField6.Value;
            Sigma_zx=app.EditField7.Value;
            Sigma_zy=app.EditField8.Value;
            Sigma_zz=app.EditField9.Value;
            
            S=[Sigma_xx Sigma_xy Sigma_xz;
                Sigma_yx Sigma_yy Sigma_yz;
                Sigma_zx Sigma_zy Sigma_zz];
            %% CALCULATING PRINCIPAL STRESS AND DIRECTION COSINES
            I1=S(1,1)+S(2,2)+S(3,3);
            I2=S(1,1)*S(2,2)+S(2,2)*S(3,3)+S(3,3)*S(1,1)-S(1,2)*S(2,1)-S(2,3)*S(3,2)-S(3,1)*S(1,3);
            I3=S(1,1)*S(2,2)*S(3,3)+S(1,2)*S(1,3)*S(2,3)+S(2,1)*S(3,2)*S(3,1)-S(1,1)*S(2,3)*S(3,2)-S(2,2)*S(1,3)*S(3,1)-S(3,3)*S(1,2)*S(2,1);
            [d,s]=eig(S); %Principal Stress and Direction COsines are Eigenvalues and eigenvectors respectively.
            S1=s(1,1);
            S2=s(2,2);
            S3=s(3,3);
            S0=sort([S1 S2 S3]);
            S1=S0(3);
            S2=S0(2);
            S3=S0(1);
            %% GENERATION OF MOHR'S CIRCLE FROM 3x3 STRESS TENSOR
            %function h = filledCircle(center,r,N,color)
            %THETA=linspace(0,2*pi,N);
            %RHO=ones(1,N)*r;
            %[X,Y] = pol2cart(THETA,RHO);
            %X=X+center(1);
            %Y=Y+center(2);
            %h=fill(X,Y,color);
            %axis square;
            %end
            %c1=[mean([S1,S2]),0];
            %c2=[mean([S2,S3]),0];
            %c3=[mean([S3,S1]),0];
            %r1=abs(0.5*(S1-S2));
            %r2=abs(0.5*(S2-S3));
            %r3=abs(0.5*(S3-S1));
            %figure
            %filledCircle(c3,r3,200,'b');
            %hold on
            %filledCircle(c2,r2,200,'m');
            %filledCircle(c1,r1,200,'c');
            %plot(c3(1),c3(2),'kd');
            %plot(c2(1),c2(2),'ks');
            %plot(c1(1),c1(2),'k+');
            %legend('Region of Mohr Circle 1 (S1,S3)','Region of Mohr Circle 2 (S2,S3)','Region of Mohr Circle 3 (S1,S2)','Center of Mohr Circle 1','Center of Mohr Circle 2','Center of Mohr Circle 3','Location','northeastoutside');
            %xlabel('Normal Stress Value');
            %ylabel('Shear Stress Value');
            %title('Mohr Circle for 3D Stress Condition');
            %grid on
            %% PRINCIPAL STRESSES AND ITS DIRECTION COSINES
            app.lambda1EditField.Value=S1;
            app.lambda2EditField.Value=S2;
            app.lambda3EditField.Value=S3;

            app.EditField10.Value=d(1,3);
            app.EditField11.Value=d(2,3);
            app.EditField12.Value=d(3,3);
            app.EditField13.Value=d(1,2);
            app.EditField14.Value=d(2,2);
            app.EditField15.Value=d(3,2);
            app.EditField16.Value=d(1,1);
            app.EditField17.Value=d(2,1);
            app.EditField18.Value=d(3,1);
        end

        % Button pushed function: DisplayButton
        function DisplayButtonPushed(app, event)
            Sigma_xx=app.EditField.Value;
            Sigma_xy=app.EditField2.Value;
            Sigma_xz=app.EditField3.Value;
            Sigma_yx=app.EditField4.Value; 
            Sigma_yy=app.EditField5.Value;
            Sigma_yz=app.EditField6.Value;
            Sigma_zx=app.EditField7.Value;
            Sigma_zy=app.EditField8.Value;
            Sigma_zz=app.EditField9.Value;
            
            S=[Sigma_xx Sigma_xy Sigma_xz;
                Sigma_yx Sigma_yy Sigma_yz;
                Sigma_zx Sigma_zy Sigma_zz];
            lambda_ellipsoid=eig(S);
            sigma_1 = lambda_ellipsoid(3);
            sigma_2 = lambda_ellipsoid(2);
            sigma_3 = lambda_ellipsoid(1);

             %% plotting ellipsoide cauchy stress Surface
             subplot(1,2,1)


             rx=sqrt(1/sigma_1);
             ry=sqrt(1/sigma_2);
             rz=sqrt(1/sigma_3);

             ellipsoid(0,0,0,rx,ry,imag(rz))
             title('Cauchys Stress Surface ','FontSize',20,'FontWeight','bold')
             xlabel('\sigma_1','FontSize',20,'FontWeight','bold')
             ylabel('\sigma_2','FontSize',20,'FontWeight','bold')
             zlabel('\sigma_3','FontSize',20,'FontWeight','bold')
             colormap default
             %% Lames Ellipsoid
             subplot(1,2,2)


             ellipsoid(0,0,0,sigma_1,sigma_2,sigma_3)

             title('Lames Ellipsoid','FontSize',20,'FontWeight','bold')
             xlabel('\sigma_1','FontSize',20,'FontWeight','bold')
             ylabel('\sigma_2','FontSize',20,'FontWeight','bold')
             zlabel('\sigma_3','FontSize',20,'FontWeight','bold')
             [d,s]=eig(S); %Principal Stress and Direction COsines are Eigenvalues and eigenvectors respectively.
            S1=s(1,1);
            S2=s(2,2);
            S3=s(3,3);
            S0=sort([S1 S2 S3]);
            S1=S0(3);
            S2=S0(2);
            S3=S0(1);
            %% GENERATION OF MOHR'S CIRCLE FROM 3x3 STRESS TENSOR
            function h = filledCircle(center,r,N,color)
            THETA=linspace(0,2*pi,N);
            RHO=ones(1,N)*r;
            [X,Y] = pol2cart(THETA,RHO);
            X=X+center(1);
            Y=Y+center(2);
            h=fill(X,Y,color);
            axis square;
            end
            c1=[mean([S1,S2]),0];
            c2=[mean([S2,S3]),0];
            c3=[mean([S3,S1]),0];
            r1=abs(0.5*(S1-S2));
            r2=abs(0.5*(S2-S3));
            r3=abs(0.5*(S3-S1));
            figure
            filledCircle(c3,r3,200,'b');
            hold on
            filledCircle(c2,r2,200,'m');
            filledCircle(c1,r1,200,'c');
            plot(c3(1),c3(2),'kd');
            plot(c2(1),c2(2),'ks');
            plot(c1(1),c1(2),'k+');
            legend('Region of Mohr Circle 1 (S1,S3)','Region of Mohr Circle 2 (S2,S3)','Region of Mohr Circle 3 (S1,S2)','Center of Mohr Circle 1','Center of Mohr Circle 2','Center of Mohr Circle 3','Location','northeastoutside');
            xlabel('Normal Stress Value');
            ylabel('Shear Stress Value');
            title('Mohr Circle for 3D Stress Condition');
            grid on
            %% DIRECTION REPRESENTATION OF PRINCIPAL AXIS ON CARTESIAN COORDINATE SYSTEM
            x1=[0;S1*d(1,3)];
            y1=[0;S1*d(2,3)];
            z1=[0;S1*d(3,3)];
            x2=[0;S2*d(1,2)];
            y2=[0;S2*d(2,2)];
            z2=[0;S2*d(3,2)];
            x3=[0;S3*d(1,1)];
            y3=[0;S3*d(2,1)];
            z3=[0;S3*d(3,1)];
            figure
            d=plot3(x1,y1,z1);
            hold on
            grid on
            e=plot3(x2,y2,z2);
            f=plot3(x3,y3,z3);
            g=plot3(0,0,0);
            g.Marker='o';
            g.MarkerSize=13;
            g.LineStyle='none';
            g.MarkerFaceColor='k';
            g.MarkerEdgeColor='k';
            d.LineWidth=7;
            d.Marker='^';
            e.LineWidth=7;
            e.Marker='^';
            f.LineWidth=7;
            f.Marker='^';
            title ('Prinicipal Stress Directions');
            xlabel('X-Axis');
            ylabel('Y-Axis');
            zlabel('Z-Axis');
            legend('Major Principal Stress Axis','Intermediate Principal Stress Axis','Minor Principal Stress Axis','Origin');



        end

        % Button pushed function: ResetButton
        function ResetButtonPushed(app, event)
            app.EditField.Value=0;
            app.EditField2.Value=0;
            app.EditField3.Value=0;
            app.EditField4.Value=0;
            app.EditField5.Value=0;
            app.EditField6.Value=0;
            app.EditField7.Value=0;
            app.EditField8.Value=0;
            app.EditField9.Value=0;
            app.lambda1EditField.Value=0;
            app.lambda2EditField.Value=0;
            app.lambda3EditField.Value=0;
            app.EditField10.Value=0;
            app.EditField11.Value=0;
            app.EditField12.Value=0;
            app.EditField13.Value=0;
            app.EditField14.Value=0;
            app.EditField15.Value=0;
            app.EditField16.Value=0;
            app.EditField17.Value=0;
            app.EditField18.Value=0;



        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create StressMatrixPanel
            app.StressMatrixPanel = uipanel(app.UIFigure);
            app.StressMatrixPanel.Title = 'Stress Matrix';
            app.StressMatrixPanel.FontWeight = 'bold';
            app.StressMatrixPanel.FontSize = 14;
            app.StressMatrixPanel.Position = [28 265 295 193];

            % Create EditFieldLabel
            app.EditFieldLabel = uilabel(app.StressMatrixPanel);
            app.EditFieldLabel.HorizontalAlignment = 'right';
            app.EditFieldLabel.Position = [8 129 52 22];
            app.EditFieldLabel.Text = 'EditField';

            % Create EditField
            app.EditField = uieditfield(app.StressMatrixPanel, 'numeric');
            app.EditField.HorizontalAlignment = 'center';
            app.EditField.Position = [8 125 87 31];

            % Create EditField2Label
            app.EditField2Label = uilabel(app.StressMatrixPanel);
            app.EditField2Label.HorizontalAlignment = 'right';
            app.EditField2Label.Position = [103 129 62 22];
            app.EditField2Label.Text = 'Edit Field2';

            % Create EditField2
            app.EditField2 = uieditfield(app.StressMatrixPanel, 'numeric');
            app.EditField2.HorizontalAlignment = 'center';
            app.EditField2.Position = [104 125 87 31];

            % Create EditField3Label
            app.EditField3Label = uilabel(app.StressMatrixPanel);
            app.EditField3Label.HorizontalAlignment = 'right';
            app.EditField3Label.Position = [202 129 62 22];
            app.EditField3Label.Text = 'Edit Field3';

            % Create EditField3
            app.EditField3 = uieditfield(app.StressMatrixPanel, 'numeric');
            app.EditField3.HorizontalAlignment = 'center';
            app.EditField3.Position = [202 125 87 31];

            % Create EditField4Label
            app.EditField4Label = uilabel(app.StressMatrixPanel);
            app.EditField4Label.HorizontalAlignment = 'right';
            app.EditField4Label.Position = [8 76 62 22];
            app.EditField4Label.Text = 'Edit Field4';

            % Create EditField4
            app.EditField4 = uieditfield(app.StressMatrixPanel, 'numeric');
            app.EditField4.HorizontalAlignment = 'center';
            app.EditField4.Position = [9 73 87 31];

            % Create EditField5Label
            app.EditField5Label = uilabel(app.StressMatrixPanel);
            app.EditField5Label.HorizontalAlignment = 'right';
            app.EditField5Label.Position = [106 76 62 22];
            app.EditField5Label.Text = 'Edit Field5';

            % Create EditField5
            app.EditField5 = uieditfield(app.StressMatrixPanel, 'numeric');
            app.EditField5.HorizontalAlignment = 'center';
            app.EditField5.Position = [106 73 87 31];

            % Create EditField6Label
            app.EditField6Label = uilabel(app.StressMatrixPanel);
            app.EditField6Label.HorizontalAlignment = 'right';
            app.EditField6Label.Position = [208 76 62 22];
            app.EditField6Label.Text = 'Edit Field6';

            % Create EditField6
            app.EditField6 = uieditfield(app.StressMatrixPanel, 'numeric');
            app.EditField6.HorizontalAlignment = 'center';
            app.EditField6.Position = [202 70 87 31];

            % Create EditField7Label
            app.EditField7Label = uilabel(app.StressMatrixPanel);
            app.EditField7Label.HorizontalAlignment = 'right';
            app.EditField7Label.Position = [9 26 62 22];
            app.EditField7Label.Text = 'Edit Field7';

            % Create EditField7
            app.EditField7 = uieditfield(app.StressMatrixPanel, 'numeric');
            app.EditField7.HorizontalAlignment = 'center';
            app.EditField7.Position = [8 22 87 31];

            % Create EditField8Label
            app.EditField8Label = uilabel(app.StressMatrixPanel);
            app.EditField8Label.HorizontalAlignment = 'right';
            app.EditField8Label.Position = [118 24 62 22];
            app.EditField8Label.Text = 'Edit Field8';

            % Create EditField8
            app.EditField8 = uieditfield(app.StressMatrixPanel, 'numeric');
            app.EditField8.HorizontalAlignment = 'center';
            app.EditField8.Position = [106 22 87 31];

            % Create EditField9Label
            app.EditField9Label = uilabel(app.StressMatrixPanel);
            app.EditField9Label.HorizontalAlignment = 'right';
            app.EditField9Label.Position = [202 26 62 22];
            app.EditField9Label.Text = 'Edit Field9';

            % Create EditField9
            app.EditField9 = uieditfield(app.StressMatrixPanel, 'numeric');
            app.EditField9.HorizontalAlignment = 'center';
            app.EditField9.Position = [202 21 87 31];

            % Create CalculateButton
            app.CalculateButton = uibutton(app.UIFigure, 'push');
            app.CalculateButton.ButtonPushedFcn = createCallbackFcn(app, @CalculateButtonPushed, true);
            app.CalculateButton.FontSize = 18;
            app.CalculateButton.Position = [95 197 186 51];
            app.CalculateButton.Text = 'Calculate';

            % Create Eigen_ValuesPanel
            app.Eigen_ValuesPanel = uipanel(app.UIFigure);
            app.Eigen_ValuesPanel.Title = 'Eigen_Values';
            app.Eigen_ValuesPanel.FontWeight = 'bold';
            app.Eigen_ValuesPanel.FontSize = 14;
            app.Eigen_ValuesPanel.Position = [357 263 248 195];

            % Create lambda1EditFieldLabel
            app.lambda1EditFieldLabel = uilabel(app.Eigen_ValuesPanel);
            app.lambda1EditFieldLabel.HorizontalAlignment = 'right';
            app.lambda1EditFieldLabel.FontSize = 14;
            app.lambda1EditFieldLabel.Position = [25 131 59 22];
            app.lambda1EditFieldLabel.Text = 'lambda1';

            % Create lambda1EditField
            app.lambda1EditField = uieditfield(app.Eigen_ValuesPanel, 'numeric');
            app.lambda1EditField.HorizontalAlignment = 'center';
            app.lambda1EditField.Position = [106 133 123 23];

            % Create lambda2EditFieldLabel
            app.lambda2EditFieldLabel = uilabel(app.Eigen_ValuesPanel);
            app.lambda2EditFieldLabel.HorizontalAlignment = 'right';
            app.lambda2EditFieldLabel.FontSize = 14;
            app.lambda2EditFieldLabel.Position = [22 81 59 22];
            app.lambda2EditFieldLabel.Text = 'lambda2';

            % Create lambda2EditField
            app.lambda2EditField = uieditfield(app.Eigen_ValuesPanel, 'numeric');
            app.lambda2EditField.HorizontalAlignment = 'center';
            app.lambda2EditField.Position = [106 82 123 23];

            % Create lambda3EditFieldLabel
            app.lambda3EditFieldLabel = uilabel(app.Eigen_ValuesPanel);
            app.lambda3EditFieldLabel.HorizontalAlignment = 'right';
            app.lambda3EditFieldLabel.FontSize = 14;
            app.lambda3EditFieldLabel.Position = [25 31 59 22];
            app.lambda3EditFieldLabel.Text = 'lambda3';

            % Create lambda3EditField
            app.lambda3EditField = uieditfield(app.Eigen_ValuesPanel, 'numeric');
            app.lambda3EditField.HorizontalAlignment = 'center';
            app.lambda3EditField.Position = [106 31 123 23];

            % Create Eigen_directionsPanel
            app.Eigen_directionsPanel = uipanel(app.UIFigure);
            app.Eigen_directionsPanel.Title = 'Eigen_directions';
            app.Eigen_directionsPanel.FontWeight = 'bold';
            app.Eigen_directionsPanel.FontSize = 14;
            app.Eigen_directionsPanel.Position = [356 41 248 195];

            % Create EditField10Label
            app.EditField10Label = uilabel(app.Eigen_directionsPanel);
            app.EditField10Label.HorizontalAlignment = 'right';
            app.EditField10Label.Position = [12 130 68 22];
            app.EditField10Label.Text = 'Edit Field10';

            % Create EditField10
            app.EditField10 = uieditfield(app.Eigen_directionsPanel, 'numeric');
            app.EditField10.HorizontalAlignment = 'center';
            app.EditField10.Position = [16 123 63 35];

            % Create EditField13Label
            app.EditField13Label = uilabel(app.Eigen_directionsPanel);
            app.EditField13Label.HorizontalAlignment = 'right';
            app.EditField13Label.Position = [23 81 41 22];
            app.EditField13Label.Text = 'Edit Field13';

            % Create EditField13
            app.EditField13 = uieditfield(app.Eigen_directionsPanel, 'numeric');
            app.EditField13.HorizontalAlignment = 'center';
            app.EditField13.Position = [18 74 63 35];

            % Create EditField16Label
            app.EditField16Label = uilabel(app.Eigen_directionsPanel);
            app.EditField16Label.HorizontalAlignment = 'right';
            app.EditField16Label.Position = [14 33 68 22];
            app.EditField16Label.Text = 'Edit Field16';

            % Create EditField16
            app.EditField16 = uieditfield(app.Eigen_directionsPanel, 'numeric');
            app.EditField16.HorizontalAlignment = 'center';
            app.EditField16.Position = [19 26 63 35];

            % Create EditField14Label
            app.EditField14Label = uilabel(app.Eigen_directionsPanel);
            app.EditField14Label.HorizontalAlignment = 'right';
            app.EditField14Label.Position = [91 84 56 22];
            app.EditField14Label.Text = 'Edit Field14';

            % Create EditField14
            app.EditField14 = uieditfield(app.Eigen_directionsPanel, 'numeric');
            app.EditField14.HorizontalAlignment = 'center';
            app.EditField14.Position = [91 73 63 35];

            % Create EditField15Label
            app.EditField15Label = uilabel(app.Eigen_directionsPanel);
            app.EditField15Label.HorizontalAlignment = 'right';
            app.EditField15Label.Position = [172 76 63 22];
            app.EditField15Label.Text = 'Edit Field15';

            % Create EditField15
            app.EditField15 = uieditfield(app.Eigen_directionsPanel, 'numeric');
            app.EditField15.HorizontalAlignment = 'center';
            app.EditField15.Position = [167 73 63 35];

            % Create EditField12Label
            app.EditField12Label = uilabel(app.Eigen_directionsPanel);
            app.EditField12Label.HorizontalAlignment = 'right';
            app.EditField12Label.Position = [177 131 54 22];
            app.EditField12Label.Text = 'Edit Field12';

            % Create EditField12
            app.EditField12 = uieditfield(app.Eigen_directionsPanel, 'numeric');
            app.EditField12.HorizontalAlignment = 'center';
            app.EditField12.Position = [167 122 63 35];

            % Create EditField11Label
            app.EditField11Label = uilabel(app.Eigen_directionsPanel);
            app.EditField11Label.HorizontalAlignment = 'right';
            app.EditField11Label.Position = [93 128 54 22];
            app.EditField11Label.Text = 'Edit Field11';

            % Create EditField11
            app.EditField11 = uieditfield(app.Eigen_directionsPanel, 'numeric');
            app.EditField11.HorizontalAlignment = 'center';
            app.EditField11.Position = [92 123 63 35];

            % Create EditField18Label
            app.EditField18Label = uilabel(app.Eigen_directionsPanel);
            app.EditField18Label.HorizontalAlignment = 'right';
            app.EditField18Label.Position = [177 34 53 22];
            app.EditField18Label.Text = 'Edit Field18';

            % Create EditField18
            app.EditField18 = uieditfield(app.Eigen_directionsPanel, 'numeric');
            app.EditField18.HorizontalAlignment = 'center';
            app.EditField18.Position = [168 23 63 35];

            % Create EditField17Label
            app.EditField17Label = uilabel(app.Eigen_directionsPanel);
            app.EditField17Label.HorizontalAlignment = 'right';
            app.EditField17Label.Position = [103 30 43 22];
            app.EditField17Label.Text = 'Edit Field17';

            % Create EditField17
            app.EditField17 = uieditfield(app.Eigen_directionsPanel, 'numeric');
            app.EditField17.HorizontalAlignment = 'center';
            app.EditField17.Position = [91 24 63 35];

            % Create DisplayButton
            app.DisplayButton = uibutton(app.UIFigure, 'push');
            app.DisplayButton.ButtonPushedFcn = createCallbackFcn(app, @DisplayButtonPushed, true);
            app.DisplayButton.FontSize = 18;
            app.DisplayButton.Position = [95 123 186 51];
            app.DisplayButton.Text = 'Display';

            % Create ResetButton
            app.ResetButton = uibutton(app.UIFigure, 'push');
            app.ResetButton.ButtonPushedFcn = createCallbackFcn(app, @ResetButtonPushed, true);
            app.ResetButton.FontSize = 18;
            app.ResetButton.Position = [95 50 186 51];
            app.ResetButton.Text = 'Reset';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end