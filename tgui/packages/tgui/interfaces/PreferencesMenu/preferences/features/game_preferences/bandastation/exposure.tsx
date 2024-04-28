import { Feature } from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const exposure_level: Feature<string> = {
  name: 'Exposure strength',
  category: 'GAMEPLAY',
  description: 'Уровень exposure.',
  component: FeatureDropdownInput,
};
